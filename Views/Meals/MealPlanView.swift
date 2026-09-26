import SwiftUI

struct MealPlanView: View {
    let profile: UserProfile

    private var grouped: [(String, [Recipe])] {
        let order = ["Breakfast", "Lunch", "Dinner", "Snack"]
        return order.compactMap { type in
            let items = SampleData.recipes.filter { $0.mealType == type }
            return items.isEmpty ? nil : (type, items)
        }
    }

    private var totalCalories: Int {
        SampleData.recipes.reduce(0) { $0 + $1.calories }
    }

    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Daily Target").font(.caption).foregroundStyle(.secondary)
                            Text("\(profile.dailyCalorieTarget) kcal").font(.headline)
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("Protein Target").font(.caption).foregroundStyle(.secondary)
                            Text("\(profile.proteinTargetGrams) g").font(.headline)
                        }
                    }
                }

                ForEach(grouped, id: \.0) { section in
                    Section(section.0) {
                        ForEach(section.1) { recipe in
                            NavigationLink(value: recipe) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(recipe.title).font(.subheadline).bold()
                                    Text("\(recipe.calories) kcal · \(recipe.proteinGrams)g protein")
                                        .font(.caption).foregroundStyle(.secondary)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Meal Plan")
            .navigationDestination(for: Recipe.self) { recipe in
                RecipeDetailView(recipe: recipe)
            }
        }
    }
}
