import Foundation

protocol MockDataProviding {
    func presets() -> [SessionPreset]
    func checkIns() -> [MoodCheckIn]
}

struct MockDataService: MockDataProviding {
    func presets() -> [SessionPreset] {
        [
            SessionPreset(title: "Deep Focus", subtitle: "Beta blend", durationMinutes: 25, baseFrequency: 18, accentColorHex: "#8B5CF6", gradientStartHex: "#312E81", gradientEndHex: "#0F172A", waveformSeed: 12),
            SessionPreset(title: "Calm Reset", subtitle: "Alpha balance", durationMinutes: 10, baseFrequency: 10, accentColorHex: "#14B8A6", gradientStartHex: "#0F766E", gradientEndHex: "#022C22", waveformSeed: 21),
            SessionPreset(title: "Sleep Drift", subtitle: "Delta ease", durationMinutes: 45, baseFrequency: 3, accentColorHex: "#60A5FA", gradientStartHex: "#1E3A8A", gradientEndHex: "#0C4A6E", waveformSeed: 37)
        ]
    }

    func checkIns() -> [MoodCheckIn] {
        let moods = ["Calm", "Focused", "Lifted", "Neutral", "Stressed"]
        return (0..<7).map { idx in
            MoodCheckIn(date: Calendar.current.date(byAdding: .day, value: -idx, to: Date()) ?? Date(), mood: moods[idx % moods.count], focus: Int.random(in: 4...10), calm: Int.random(in: 4...10))
        }
    }
}
