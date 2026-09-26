import SwiftUI
import SwiftData

struct WorkoutDetailView: View {
    let workout: Workout
    let profile: UserProfile
    @Environment(\.modelContext) private var modelContext

    @State private var currentIndex = 0
    @State private var isResting = false
    @State private var restRemaining = 0
    @State private var startedAt = Date()
    @State private var completed = false
    @State private var timer: Timer? = nil

    private var currentExercise: Exercise? {
        currentIndex < workout.exercises.count ? workout.exercises[currentIndex] : nil
    }

    var body: some View {
        VStack(spacing: 20) {
            if completed {
                completedView
            } else if let exercise = currentExercise {
                ProgressView(value: Double(currentIndex), total: Double(workout.exercises.count))
                    .padding(.horizontal)

                Text("Exercise \(currentIndex + 1) of \(workout.exercises.count)")
                    .font(.caption).foregroundStyle(.secondary)

                VStack(spacing: 10) {
                    Text(exercise.name).font(.title2).bold()
                    Text("\(exercise.sets) sets × \(exercise.reps)").font(.headline)
                    Text(exercise.instructions)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                    Label(exercise.equipment, systemImage: "wrench.and.screwdriver")
                        .font(.caption)
                }
                .padding()
                .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)

                if isResting {
                    VStack(spacing: 8) {
                        Text("Rest").font(.headline)
                        Text("\(restRemaining)s").font(.system(size: 40, weight: .bold, design: .rounded))
                    }
                } else {
                    Button(currentIndex == workout.exercises.count - 1 ? "Finish Workout" : "Done — Rest & Next") {
                        advance(exercise: exercise)
                    }
                    .buttonStyle(.borderedProminent)
                }

                Spacer()
            }
        }
        .padding(.top)
        .navigationTitle(workout.title)
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear { timer?.invalidate() }
    }

    private var completedView: some View {
        VStack(spacing: 16) {
            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 60))
                .foregroundStyle(.green)
            Text("Workout Complete!").font(.title2).bold()
            Text("Nice work finishing \(workout.title).")
                .foregroundStyle(.secondary)
        }
        .padding()
    }

    private func advance(exercise: Exercise) {
        if currentIndex == workout.exercises.count - 1 {
            logCompletion()
            completed = true
            return
        }
        if exercise.restSeconds > 0 {
            isResting = true
            restRemaining = exercise.restSeconds
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { t in
                if restRemaining > 1 {
                    restRemaining -= 1
                } else {
                    t.invalidate()
                    isResting = false
                    currentIndex += 1
                }
            }
        } else {
            currentIndex += 1
        }
    }

    private func logCompletion() {
        let minutes = max(1, Int(Date().timeIntervalSince(startedAt) / 60))
        let log = WorkoutLog(
            workoutName: workout.title,
            location: workout.location,
            durationMinutes: minutes,
            completedExerciseNames: workout.exercises.map { $0.name }
        )
        modelContext.insert(log)
        try? modelContext.save()
    }
}
