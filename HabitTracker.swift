import SwiftUI
import CoreData

struct Habit: Identifiable {
    let id = UUID()
    var name: String
    var progress: Int
    var lastUpdated: Date
}

class HabitViewModel: ObservableObject {
    @Published var habits: [Habit] = [
        Habit(name: "Read", progress: 3, lastUpdated: Date()),
        Habit(name: "Workout", progress: 5, lastUpdated: Date())
    ]

    func addHabit(name: String) {
        let newHabit = Habit(name: name, progress: 0, lastUpdated: Date())
        habits.append(newHabit)
    }

    func incrementProgress(for habit: Habit) {
        if let index = habits.firstIndex(where: { $0.id == habit.id }) {
            habits[index].progress += 1
            habits[index].lastUpdated = Date()
        }
    }

    func fetchAISuggestion(completion: @escaping (String) -> Void) {
        // Simulated GPT-based suggestion
        completion("Try meditating 10 minutes a day to boost focus and mental clarity.")
    }
}

struct ContentView: View {
    @ObservedObject var viewModel = HabitViewModel()
    @State private var newHabitName = ""
    @State private var aiSuggestion = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New habit", text: $newHabitName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Add") {
                        viewModel.addHabit(name: newHabitName)
                        newHabitName = ""
                    }
                }.padding()

                List {
                    ForEach(viewModel.habits) { habit in
                        HStack {
                            Text(habit.name)
                            Spacer()
                            Text("Progress: \(habit.progress)")
                            Button("➕") {
                                viewModel.incrementProgress(for: habit)
                            }.buttonStyle(BorderlessButtonStyle())
                        }
                    }
                }

                Button("Get AI Suggestion") {
                    viewModel.fetchAISuggestion { suggestion in
                        aiSuggestion = suggestion
                    }
                }.padding()

                if !aiSuggestion.isEmpty {
                    Text("💡 AI Suggestion: \(aiSuggestion)")
                        .italic()
                        .padding()
                        .multilineTextAlignment(.center)
                }

                Spacer()
            }
            .navigationTitle("Smart Habit Tracker")
        }
    }
}

@main
struct HabitTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
