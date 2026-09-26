import Foundation
import SwiftData

// MARK: - Goal

enum FitnessGoal: String, Codable, CaseIterable, Identifiable {
    case loseWeight = "Lose Weight"
    case buildMuscle = "Build Muscle"
    case getStronger = "Get Stronger"
    case improveEndurance = "Improve Endurance"
    case generalHealth = "General Health"
    case custom = "Custom"

    var id: String { rawValue }

    var icon: String {
        switch self {
        case .loseWeight: return "flame.fill"
        case .buildMuscle: return "figure.strengthtraining.traditional"
        case .getStronger: return "dumbbell.fill"
        case .improveEndurance: return "figure.run"
        case .generalHealth: return "heart.fill"
        case .custom: return "star.fill"
        }
    }

    var blurb: String {
        switch self {
        case .loseWeight: return "Calorie deficit + cardio-leaning workouts"
        case .buildMuscle: return "Progressive overload + a calorie surplus"
        case .getStronger: return "Heavy compound lifts, lower reps"
        case .improveEndurance: return "Cardio-focused, higher rep ranges"
        case .generalHealth: return "Balanced mix of movement and meals"
        case .custom: return "Set your own targets"
        }
    }
}

enum Location: String, Codable, CaseIterable, Identifiable {
    case gym = "Gym"
    case home = "Home"
    var id: String { rawValue }
}

// MARK: - Persisted user profile

@Model
final class UserProfile {
    var name: String
    var goalRaw: String
    var customGoalName: String
    var preferredLocationRaw: String
    var weightKg: Double
    var heightCm: Double
    var age: Int
    var dailyCalorieTarget: Int
    var proteinTargetGrams: Int
    var createdAt: Date

    init(
        name: String = "",
        goal: FitnessGoal = .generalHealth,
        customGoalName: String = "",
        preferredLocation: Location = .home,
        weightKg: Double = 70,
        heightCm: Double = 170,
        age: Int = 25,
        dailyCalorieTarget: Int = 2000,
        proteinTargetGrams: Int = 120
    ) {
        self.name = name
        self.goalRaw = goal.rawValue
        self.customGoalName = customGoalName
        self.preferredLocationRaw = preferredLocation.rawValue
        self.weightKg = weightKg
        self.heightCm = heightCm
        self.age = age
        self.dailyCalorieTarget = dailyCalorieTarget
        self.proteinTargetGrams = proteinTargetGrams
        self.createdAt = Date()
    }

    var goal: FitnessGoal {
        get { FitnessGoal(rawValue: goalRaw) ?? .generalHealth }
        set { goalRaw = newValue.rawValue }
    }

    var preferredLocation: Location {
        get { Location(rawValue: preferredLocationRaw) ?? .home }
        set { preferredLocationRaw = newValue.rawValue }
    }
}

// MARK: - Workout log (persisted history)

@Model
final class WorkoutLog {
    var workoutName: String
    var date: Date
    var locationRaw: String
    var durationMinutes: Int
    var completedExerciseNames: [String]

    init(workoutName: String, date: Date = Date(), location: Location, durationMinutes: Int, completedExerciseNames: [String]) {
        self.workoutName = workoutName
        self.date = date
        self.locationRaw = location.rawValue
        self.durationMinutes = durationMinutes
        self.completedExerciseNames = completedExerciseNames
    }
}

// MARK: - Static content models (not persisted, loaded from SampleData)

struct Exercise: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let sets: Int
    let reps: String
    let restSeconds: Int
    let instructions: String
    let equipment: String
}

struct Workout: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let location: Location
    let goalTags: [FitnessGoal]
    let estimatedMinutes: Int
    let exercises: [Exercise]
}

struct Recipe: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let calories: Int
    let proteinGrams: Int
    let carbsGrams: Int
    let fatGrams: Int
    let mealType: String // Breakfast, Lunch, Dinner, Snack
    let ingredients: [String]
    let steps: [String]
}
