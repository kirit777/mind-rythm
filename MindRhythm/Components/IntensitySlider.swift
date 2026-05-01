import SwiftUI

struct IntensitySlider: View {
    @Binding var value: Double

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Intensity")
                .font(.caption)
                .foregroundStyle(.white.opacity(0.7))
            Slider(value: $value, in: 0...1)
                .tint(.white)
        }
    }
}
