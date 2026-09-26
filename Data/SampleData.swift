import Foundation

enum SampleData {

    // MARK: Workouts

    static let workouts: [Workout] = [
        Workout(
            title: "Home Bodyweight Burner",
            location: .home,
            goalTags: [.loseWeight, .generalHealth, .improveEndurance],
            estimatedMinutes: 30,
            exercises: [
                Exercise(name: "Jumping Jacks", sets: 3, reps: "45 sec", restSeconds: 20, instructions: "Feet together to wide, arms overhead, quick rhythm.", equipment: "None"),
                Exercise(name: "Bodyweight Squats", sets: 4, reps: "15", restSeconds: 45, instructions: "Feet shoulder-width, chest up, sit hips back and down.", equipment: "None"),
                Exercise(name: "Push-Ups", sets: 3, reps: "10-15", restSeconds: 60, instructions: "Hands under shoulders, body straight, lower chest to floor.", equipment: "None"),
                Exercise(name: "Mountain Climbers", sets: 3, reps: "30 sec", restSeconds: 30, instructions: "Plank position, drive knees to chest alternately, fast pace.", equipment: "None"),
                Exercise(name: "Plank Hold", sets: 3, reps: "30-45 sec", restSeconds: 30, instructions: "Forearms down, straight line from head to heels, brace core.", equipment: "None")
            ]
        ),
        Workout(
            title: "Home Strength (Dumbbells)",
            location: .home,
            goalTags: [.buildMuscle, .getStronger],
            estimatedMinutes: 40,
            exercises: [
                Exercise(name: "Goblet Squats", sets: 4, reps: "10-12", restSeconds: 75, instructions: "Hold dumbbell at chest, squat deep, drive up through heels.", equipment: "Dumbbells"),
                Exercise(name: "Dumbbell Rows", sets: 4, reps: "10-12 per side", restSeconds: 60, instructions: "Hinge forward, row dumbbell to hip, squeeze shoulder blade.", equipment: "Dumbbells"),
                Exercise(name: "Dumbbell Shoulder Press", sets: 3, reps: "10-12", restSeconds: 60, instructions: "Press dumbbells overhead from shoulder height, control the descent.", equipment: "Dumbbells"),
                Exercise(name: "Romanian Deadlifts", sets: 3, reps: "10-12", restSeconds: 75, instructions: "Slight knee bend, hinge at hips, dumbbells close to legs.", equipment: "Dumbbells"),
                Exercise(name: "Dumbbell Bicep Curls", sets: 3, reps: "12", restSeconds: 45, instructions: "Elbows pinned to sides, curl fully, control the negative.", equipment: "Dumbbells")
            ]
        ),
        Workout(
            title: "Gym Push Day",
            location: .gym,
            goalTags: [.buildMuscle, .getStronger],
            estimatedMinutes: 55,
            exercises: [
                Exercise(name: "Barbell Bench Press", sets: 4, reps: "6-8", restSeconds: 120, instructions: "Retract shoulder blades, lower bar to mid-chest, press up.", equipment: "Barbell + Bench"),
                Exercise(name: "Incline Dumbbell Press", sets: 3, reps: "8-10", restSeconds: 90, instructions: "30-45° incline, press dumbbells up and slightly together.", equipment: "Dumbbells + Bench"),
                Exercise(name: "Cable Chest Fly", sets: 3, reps: "12-15", restSeconds: 60, instructions: "Slight bend in elbows, bring handles together in an arc.", equipment: "Cable Machine"),
                Exercise(name: "Seated Shoulder Press Machine", sets: 3, reps: "10", restSeconds: 75, instructions: "Press handles overhead, avoid locking elbows out hard.", equipment: "Machine"),
                Exercise(name: "Tricep Rope Pushdown", sets: 3, reps: "12-15", restSeconds: 45, instructions: "Elbows locked at sides, extend fully, squeeze at bottom.", equipment: "Cable Machine")
            ]
        ),
        Workout(
            title: "Gym Leg Day",
            location: .gym,
            goalTags: [.getStronger, .buildMuscle],
            estimatedMinutes: 60,
            exercises: [
                Exercise(name: "Barbell Back Squat", sets: 5, reps: "5", restSeconds: 150, instructions: "Bar on upper traps, brace core, squat to depth, drive up.", equipment: "Barbell + Rack"),
                Exercise(name: "Leg Press", sets: 4, reps: "10-12", restSeconds: 90, instructions: "Feet shoulder-width on platform, lower under control, press through heels.", equipment: "Leg Press Machine"),
                Exercise(name: "Walking Lunges", sets: 3, reps: "12 per leg", restSeconds: 60, instructions: "Long step, back knee toward floor, drive through front heel.", equipment: "Dumbbells"),
                Exercise(name: "Leg Curl Machine", sets: 3, reps: "12", restSeconds: 60, instructions: "Curl heels toward glutes, control the release.", equipment: "Machine"),
                Exercise(name: "Standing Calf Raise", sets: 4, reps: "15", restSeconds: 45, instructions: "Full stretch at bottom, rise onto toes, pause at top.", equipment: "Machine")
            ]
        ),
        Workout(
            title: "Cardio Endurance Session",
            location: .gym,
            goalTags: [.improveEndurance, .loseWeight],
            estimatedMinutes: 35,
            exercises: [
                Exercise(name: "Treadmill Intervals", sets: 6, reps: "1 min fast / 2 min easy", restSeconds: 0, instructions: "Alternate a hard pace with an easy recovery pace.", equipment: "Treadmill"),
                Exercise(name: "Rowing Machine", sets: 4, reps: "500m", restSeconds: 60, instructions: "Legs-back-arms drive sequence, control the return.", equipment: "Rower"),
                Exercise(name: "Battle Ropes", sets: 4, reps: "30 sec", restSeconds: 30, instructions: "Alternate big waves, keep core braced.", equipment: "Battle Ropes"),
                Exercise(name: "Stair Climber", sets: 1, reps: "10 min", restSeconds: 0, instructions: "Steady moderate pace, upright posture.", equipment: "Stair Climber Machine")
            ]
        )
    ]

    // MARK: Recipes

    static let recipes: [Recipe] = [
        Recipe(
            title: "High-Protein Overnight Oats",
            calories: 420,
            proteinGrams: 32,
            carbsGrams: 48,
            fatGrams: 10,
            mealType: "Breakfast",
            ingredients: ["1/2 cup rolled oats", "1 scoop protein powder", "3/4 cup milk", "1/2 cup Greek yogurt", "1 tbsp chia seeds", "1/2 banana, sliced"],
            steps: [
                "Mix oats, protein powder, milk, yogurt, and chia seeds in a jar.",
                "Stir until fully combined, no dry clumps.",
                "Cover and refrigerate overnight (or at least 4 hours).",
                "Top with sliced banana before eating."
            ]
        ),
        Recipe(
            title: "Grilled Chicken & Rice Bowl",
            calories: 560,
            proteinGrams: 48,
            carbsGrams: 55,
            fatGrams: 14,
            mealType: "Lunch",
            ingredients: ["6 oz chicken breast", "1 cup cooked jasmine rice", "1 cup broccoli", "1 tbsp olive oil", "Salt, pepper, garlic powder", "1 tbsp soy sauce"],
            steps: [
                "Season chicken with salt, pepper, and garlic powder.",
                "Grill or pan-sear chicken 6-7 minutes per side until cooked through.",
                "Steam broccoli for 5 minutes until tender-crisp.",
                "Slice chicken and serve over rice with broccoli.",
                "Drizzle with olive oil and soy sauce."
            ]
        ),
        Recipe(
            title: "Salmon, Sweet Potato & Greens",
            calories: 610,
            proteinGrams: 40,
            carbsGrams: 45,
            fatGrams: 24,
            mealType: "Dinner",
            ingredients: ["6 oz salmon fillet", "1 medium sweet potato", "2 cups mixed greens", "1 tbsp olive oil", "Lemon wedge", "Salt and pepper"],
            steps: [
                "Preheat oven to 400°F (200°C).",
                "Cube sweet potato, toss with a little oil, roast 25 minutes.",
                "Season salmon with salt and pepper, bake 12-15 minutes until flaky.",
                "Toss greens with olive oil and a squeeze of lemon.",
                "Plate salmon over sweet potato with greens on the side."
            ]
        ),
        Recipe(
            title: "Veggie & Egg Scramble",
            calories: 380,
            proteinGrams: 26,
            carbsGrams: 18,
            fatGrams: 22,
            mealType: "Breakfast",
            ingredients: ["3 whole eggs", "1/2 cup bell peppers, diced", "1/2 cup spinach", "1/4 cup onion, diced", "1 tsp olive oil", "Salt and pepper"],
            steps: [
                "Heat olive oil in a pan over medium heat.",
                "Sauté onion and peppers 3-4 minutes until softened.",
                "Add spinach and cook until wilted.",
                "Whisk eggs, pour into pan, scramble until just set.",
                "Season with salt and pepper."
            ]
        ),
        Recipe(
            title: "Greek Yogurt Protein Bowl",
            calories: 300,
            proteinGrams: 28,
            carbsGrams: 30,
            fatGrams: 6,
            mealType: "Snack",
            ingredients: ["1 cup Greek yogurt", "1/2 cup mixed berries", "1 tbsp honey", "2 tbsp granola"],
            steps: [
                "Spoon yogurt into a bowl.",
                "Top with berries and granola.",
                "Drizzle with honey."
            ]
        ),
        Recipe(
            title: "Turkey Lettuce Wraps",
            calories: 340,
            proteinGrams: 34,
            carbsGrams: 10,
            fatGrams: 16,
            mealType: "Lunch",
            ingredients: ["6 oz ground turkey", "1 tbsp low-sodium soy sauce", "1 tsp sesame oil", "1/4 cup shredded carrot", "1 clove garlic, minced", "Butter lettuce leaves"],
            steps: [
                "Cook ground turkey in a pan over medium-high heat until browned.",
                "Add garlic, soy sauce, and sesame oil, stir 1-2 minutes.",
                "Mix in shredded carrot.",
                "Spoon mixture into lettuce leaves and fold to eat."
            ]
        )
    ]

    static func workouts(for location: Location, goal: FitnessGoal) -> [Workout] {
        let matches = workouts.filter { $0.location == location && $0.goalTags.contains(goal) }
        return matches.isEmpty ? workouts.filter { $0.location == location } : matches
    }
}
