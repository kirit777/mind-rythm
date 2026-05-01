import Foundation

struct SessionPreset: Identifiable, Codable, Hashable {
    let id: UUID
    let title: String
    let subtitle: String
    let durationMinutes: Int
    let baseFrequency: Double
    let accentColorHex: String
    let gradientStartHex: String
    let gradientEndHex: String
    let waveformSeed: Int

    init(id: UUID = UUID(), title: String, subtitle: String, durationMinutes: Int, baseFrequency: Double, accentColorHex: String, gradientStartHex: String, gradientEndHex: String, waveformSeed: Int) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.durationMinutes = durationMinutes
        self.baseFrequency = baseFrequency
        self.accentColorHex = accentColorHex
        self.gradientStartHex = gradientStartHex
        self.gradientEndHex = gradientEndHex
        self.waveformSeed = waveformSeed
    }
}
