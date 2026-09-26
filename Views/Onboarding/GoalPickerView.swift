import SwiftUI
import SwiftData

struct GoalPickerView: View {
    @Environment(\.modelContext) private var modelContext

    @State private var selectedGoal: FitnessGoal? = nil
    @State private var customGoalName: String = ""
    @State private var name: String = ""
    @State private var weight: Double = 70
    @State private var height: Double = 170
    @State private var age: Int = 25
    @State private var preferredLocation: Location = .home
    @State private var step: Int = 0

    var body: some View {
        NavigationStack {
            VStack {
                if step == 0 {
                    goalStep
                } else {
                    detailsStep
                }
            }
            .padding()
            .navigationTitle(step == 0 ? "Choose Your Goal" : "A Few Details")
        }
    }

    private var goalStep: some View {
        ScrollView {
            VStack(spacing: 14) {
                Text("What are you working toward?")
                    .font(.headline)
                    .padding(.top, 8)

                ForEach(FitnessGoal.allCases) { goal in
                    Button {
                        selectedGoal = goal
                    } label: {
                        HStack {
                            Image(systemName: goal.icon)
                                .frame(width: 28)
                            VStack(alignment: .leading) {
                                Text(goal.rawValue).font(.subheadline).bold()
                                Text(goal.blurb).font(.caption).foregroundStyle(.secondary)
                            }
                            Spacer()
                            if selectedGoal == goal {
                                Image(systemName: "checkmark.circle.fill").foregroundStyle(.green)
                            }
                        }
                        .padding()
                        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 12))
                    }
                    .buttonStyle(.plain)
                }

                if selectedGoal == .custom {
                    TextField("Name your own goal", text: $customGoalName)
                        .textFieldStyle(.roundedBorder)
                        .padding(.top, 4)
                }

                Button("Continue") { step = 1 }
                    .buttonStyle(.borderedProminent)
                    .disabled(selectedGoal == nil || (selectedGoal == .custom && customGoalName.trimmingCharacters(in: .whitespaces).isEmpty))
                    .padding(.top, 12)
            }
        }
    }

    private var detailsStep: some View {
        Form {
            Section("About You") {
                TextField("Name", text: $name)
                Stepper("Age: \(age)", value: $age, in: 13...90)
                HStack {
                    Text("Weight (kg)")
                    Spacer()
                    TextField("kg", value: $weight, format: .number).keyboardType(.decimalPad).multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Height (cm)")
                    Spacer()
                    TextField("cm", value: $height, format: .number).keyboardType(.decimalPad).multilineTextAlignment(.trailing)
                }
            }
            Section("Where do you train?") {
                Picker("Location", selection: $preferredLocation) {
                    ForEach(Location.allCases) { loc in Text(loc.rawValue).tag(loc) }
                }
                .pickerStyle(.segmented)
            }
            Section {
                Button("Start Training") { save() }
                    .buttonStyle(.borderedProminent)
                    .frame(maxWidth: .infinity)
            }
        }
    }

    private func save() {
        guard let goal = selectedGoal else { return }
        let calorieTarget = estimatedCalories()
        let profile = UserProfile(
            name: name.isEmpty ? "Athlete" : name,
            goal: goal,
            customGoalName: goal == .custom ? customGoalName : "",
            preferredLocation: preferredLocation,
            weightKg: weight,
            heightCm: height,
            age: age,
            dailyCalorieTarget: calorieTarget,
            proteinTargetGrams: Int(weight * 1.8)
        )
        modelContext.insert(profile)
        try? modelContext.save()
    }

    private func estimatedCalories() -> Int {
        // Simple Mifflin-St Jeor estimate, adjusted by goal.
        let bmr = (10 * weight) + (6.25 * height) - (5 * Double(age)) + 5
        let maintenance = bmr * 1.4
        switch selectedGoal {
        case .loseWeight: return Int(maintenance - 400)
        case .buildMuscle: return Int(maintenance + 300)
        default: return Int(maintenance)
        }
    }
}
