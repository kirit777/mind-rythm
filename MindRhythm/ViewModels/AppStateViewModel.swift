import Foundation
import Combine

final class AppStateViewModel: ObservableObject {
    @Published var selectedPreset: SessionPreset?
    @Published var isSessionActive = false
    @Published var progress: Double = 0
    @Published var intensity: Double = 0.6
    @Published var ambientEnabled = true

    @Published private(set) var presets: [SessionPreset] = []
    @Published private(set) var checkIns: [MoodCheckIn] = []

    private let dataService: MockDataProviding
    private var timerCancellable: AnyCancellable?

    init(dataService: MockDataProviding = MockDataService()) {
        self.dataService = dataService
        self.presets = dataService.presets()
        self.checkIns = dataService.checkIns()
        self.selectedPreset = presets.first
    }

    func toggleSession() {
        isSessionActive.toggle()
        if isSessionActive {
            startTimer()
        } else {
            stopTimer()
        }
    }

    private func startTimer() {
        stopTimer()
        timerCancellable = Timer.publish(every: 0.05, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self else { return }
                self.progress += 0.0015 + (self.intensity * 0.002)
                if self.progress >= 1 {
                    self.progress = 0
                    self.isSessionActive = false
                    self.stopTimer()
                }
            }
    }

    private func stopTimer() {
        timerCancellable?.cancel()
        timerCancellable = nil
    }
}
