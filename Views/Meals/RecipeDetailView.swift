import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                Text(recipe.title).font(.title2).bold()

                HStack(spacing: 16) {
                    macroLabel("Calories", "\(recipe.calories)")
                    macroLabel("Protein", "\(recipe.proteinGrams)g")
                    macroLabel("Carbs", "\(recipe.carbsGrams)g")
                    macroLabel("Fat", "\(recipe.fatGrams)g")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Ingredients").font(.headline)
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        Label(ingredient, systemImage: "circle.fill")
                            .font(.subheadline)
                            .labelStyle(.titleAndIcon)
                            .imageScale(.small)
                    }
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("Steps").font(.headline)
                    ForEach(Array(recipe.steps.enumerated()), id: \.offset) { index, step in
                        HStack(alignment: .top, spacing: 10) {
                            Text("\(index + 1)")
                                .font(.caption).bold()
                                .frame(width: 22, height: 22)
                                .background(Circle().fill(.blue.opacity(0.2)))
                            Text(step).font(.subheadline)
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle(recipe.mealType)
        .navigationBarTitleDisplayMode(.inline)
    }

    private func macroLabel(_ title: String, _ value: String) -> some View {
        VStack {
            Text(value).font(.subheadline).bold()
            Text(title).font(.caption2).foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
    }
}
