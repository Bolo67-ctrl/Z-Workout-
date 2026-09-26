import SwiftUI

struct WorkoutListView: View {
    let profile: UserProfile
    @State private var location: Location

    init(profile: UserProfile) {
        self.profile = profile
        _location = State(initialValue: profile.preferredLocation)
    }

    private var workouts: [Workout] {
        SampleData.workouts(for: location, goal: profile.goal)
    }

    var body: some View {
        NavigationStack {
            VStack {
                Picker("Location", selection: $location) {
                    ForEach(Location.allCases) { loc in Text(loc.rawValue).tag(loc) }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                List(workouts) { workout in
                    NavigationLink(value: workout) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(workout.title).font(.headline)
                            Text("\(workout.exercises.count) exercises · ~\(workout.estimatedMinutes) min")
                                .font(.caption).foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Workouts")
            .navigationDestination(for: Workout.self) { workout in
                WorkoutDetailView(workout: workout, profile: profile)
            }
        }
    }
}
