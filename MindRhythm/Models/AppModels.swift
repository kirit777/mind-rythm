import SwiftUI

struct UserModel {
    var name: String
    var age: Int
    var weight: Int
    var height: Int
}

struct HealthStat: Identifiable {
    let id = UUID()
    let title: String
    let value: String
    let unit: String
    let icon: String
    let tint: Color
    let background: Color
}

struct HRVDataPoint: Identifiable {
    let id = UUID()
    let hour: Int
    let value: Double
}

enum MoodState: String, CaseIterable, Identifiable {
    case excellent, good, neutral, low, bad

    var id: String { rawValue }
    var emoji: String {
        switch self {
        case .excellent: return "😁"
        case .good: return "🙂"
        case .neutral: return "😐"
        case .low: return "😔"
        case .bad: return "😢"
        }
    }

    var label: String {
        switch self {
        case .excellent: return "Lieliska"
        case .good: return "Laba"
        case .neutral: return "Neitrāla"
        case .low: return "Zema"
        case .bad: return "Slikta"
        }
    }
}
