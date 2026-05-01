import Foundation

struct MoodCheckIn: Identifiable, Hashable {
    let id: UUID
    let date: Date
    let mood: String
    let focus: Int
    let calm: Int

    init(id: UUID = UUID(), date: Date, mood: String, focus: Int, calm: Int) {
        self.id = id
        self.date = date
        self.mood = mood
        self.focus = focus
        self.calm = calm
    }
}
