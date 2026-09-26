import SwiftUI
import SwiftData

struct ProfileView: View {
    @Bindable var profile: UserProfile
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationStack {
            Form {
                Section("About You") {
                    TextField("Name", text: $profile.name)
                    Stepper("Age: \(profile.age)", value: $profile.age, in: 13...90)
                    HStack {
                        Text("Weight (kg)")
                        Spacer()
                        TextField("kg", value: $profile.weightKg, format: .number)
                            .keyboardType(.decimalPad).multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Height (cm)")
                        Spacer()
                        TextField("cm", value: $profile.heightCm, format: .number)
                            .keyboardType(.decimalPad).multilineTextAlignment(.trailing)
                    }
                }

                Section("Goal") {
                    Picker("Goal", selection: $profile.goal) {
                        ForEach(FitnessGoal.allCases) { goal in Text(goal.rawValue).tag(goal) }
                    }
                    if profile.goal == .custom {
                        TextField("Custom goal name", text: $profile.customGoalName)
                    }
                    Picker("Trains at", selection: $profile.preferredLocation) {
                        ForEach(Location.allCases) { loc in Text(loc.rawValue).tag(loc) }
                    }
                }

                Section("Nutrition Targets") {
                    Stepper("Calories: \(profile.dailyCalorieTarget) kcal", value: $profile.dailyCalorieTarget, in: 1200...5000, step: 50)
                    Stepper("Protein: \(profile.proteinTargetGrams) g", value: $profile.proteinTargetGrams, in: 40...300, step: 5)
                }
            }
            .navigationTitle("Profile")
            .onChange(of: profile.name) { try? modelContext.save() }
            .onChange(of: profile.dailyCalorieTarget) { try? modelContext.save() }
            .onChange(of: profile.proteinTargetGrams) { try? modelContext.save() }
        }
    }
}
