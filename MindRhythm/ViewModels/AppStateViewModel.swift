import SwiftUI

final class AppStateViewModel: ObservableObject {
    @Published var selectedTab: TabItem = .dashboard
    @Published var expandedSections: Set<String> = ["Emocionālā labsajūta"]
    @Published var selectedMood: MoodState = .good
    @Published var energy: Double = 7
    @Published var stress: Double = 4
    @Published var breathingActive = false
    @Published var breathingPhaseText = "Pieskarieties, lai sāktu"
    @Published var breathingScale: CGFloat = 1
    @Published var stressProgress: Double = 0.35

    let user = UserModel(name: "Anna", age: 34, weight: 65, height: 170)

    let hrv: [HRVDataPoint] = [
        .init(hour: 0, value: 51), .init(hour: 1, value: 52), .init(hour: 2, value: 51), .init(hour: 3, value: 53),
        .init(hour: 4, value: 58), .init(hour: 5, value: 55), .init(hour: 6, value: 59), .init(hour: 7, value: 54),
        .init(hour: 8, value: 60), .init(hour: 9, value: 60), .init(hour: 10, value: 61), .init(hour: 11, value: 57),
        .init(hour: 12, value: 52), .init(hour: 13, value: 49), .init(hour: 14, value: 52), .init(hour: 15, value: 50),
        .init(hour: 16, value: 56), .init(hour: 17, value: 60), .init(hour: 18, value: 63), .init(hour: 19, value: 64),
        .init(hour: 20, value: 60), .init(hour: 21, value: 63), .init(hour: 22, value: 69), .init(hour: 23, value: 67)
    ]

    private var breathingTask: Task<Void, Never>?

    func toggleSection(_ title: String) {
        if expandedSections.contains(title) { expandedSections.remove(title) } else { expandedSections.insert(title) }
    }

    func startBreathing() {
        if breathingActive {
            breathingTask?.cancel()
            breathingTask = nil
            breathingActive = false
            breathingPhaseText = "Pieskarieties, lai sāktu"
            withAnimation(.easeInOut(duration: 0.4)) { breathingScale = 1 }
            return
        }
        breathingActive = true
        breathingTask = Task { @MainActor in
            while !Task.isCancelled {
                breathingPhaseText = "Ieelpa"
                withAnimation(.easeInOut(duration: 4)) { breathingScale = 1.35 }
                try? await Task.sleep(nanoseconds: 4_000_000_000)
                breathingPhaseText = "Aizture"
                try? await Task.sleep(nanoseconds: 4_000_000_000)
                breathingPhaseText = "Izelpa"
                withAnimation(.easeInOut(duration: 4)) { breathingScale = 1.0 }
                try? await Task.sleep(nanoseconds: 4_000_000_000)
            }
        }
    }
}

enum TabItem: String, CaseIterable {
    case dashboard = "Pārskats"
    case breathing = "Elpo"
    case statistics = "Statistika"
    case profile = "Profils"

    var icon: String {
        switch self {
        case .dashboard: return "waveform.path.ecg"
        case .breathing: return "wind"
        case .statistics: return "chart.bar"
        case .profile: return "person"
        }
    }
}
