import SwiftUI
import SwiftData

struct RootView: View {
    @Query private var profiles: [UserProfile]

    var body: some View {
        if let profile = profiles.first {
            MainTabView(profile: profile)
        } else {
            GoalPickerView()
        }
    }
}

struct MainTabView: View {
    let profile: UserProfile

    var body: some View {
        TabView {
            HomeView(profile: profile)
                .tabItem { Label("Home", systemImage: "house.fill") }

            WorkoutListView(profile: profile)
                .tabItem { Label("Workouts", systemImage: "dumbbell.fill") }

            MealPlanView(profile: profile)
                .tabItem { Label("Meals", systemImage: "fork.knife") }

            ProfileView(profile: profile)
                .tabItem { Label("Profile", systemImage: "person.fill") }
        }
    }
}
