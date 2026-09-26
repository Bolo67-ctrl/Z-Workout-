import SwiftUI
import SwiftData

struct HomeView: View {
    let profile: UserProfile
    @Query(sort: \WorkoutLog.date, order: .reverse) private var logs: [WorkoutLog]

    private var goalName: String {
        profile.goal == .custom ? profile.customGoalName : profile.goal.rawValue
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Welcome back, \(profile.name)").font(.title2).bold()
                        Text("Goal: \(goalName)").foregroundStyle(.secondary)
                    }

                    HStack(spacing: 12) {
                        statCard(title: "Calorie Target", value: "\(profile.dailyCalorieTarget) kcal", icon: "flame.fill")
                        statCard(title: "Protein Target", value: "\(profile.proteinTargetGrams) g", icon: "leaf.fill")
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Recent Workouts").font(.headline)
                        if logs.isEmpty {
                            Text("No workouts logged yet. Head to the Workouts tab to get started.")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        } else {
                            ForEach(logs.prefix(3)) { log in
                                HStack {
                                    Image(systemName: log.locationRaw == Location.gym.rawValue ? "building.2.fill" : "house.fill")
                                    VStack(alignment: .leading) {
                                        Text(log.workoutName).font(.subheadline).bold()
                                        Text(log.date.formatted(date: .abbreviated, time: .omitted))
                                            .font(.caption).foregroundStyle(.secondary)
                                    }
                                    Spacer()
                                    Text("\(log.durationMinutes) min").font(.caption)
                                }
                                .padding(10)
                                .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("FitGuide")
        }
    }

    private func statCard(title: String, value: String, icon: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Image(systemName: icon)
            Text(value).font(.title3).bold()
            Text(title).font(.caption).foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 12))
    }
}
