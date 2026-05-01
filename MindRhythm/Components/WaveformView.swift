import SwiftUI

struct WaveformView: View {
    let seed: Int
    let intensity: Double
    let animatedPhase: Double

    var body: some View {
        Canvas { context, size in
            var path = Path()
            let midY = size.height / 2
            let amp = size.height * 0.28 * intensity
            path.move(to: CGPoint(x: 0, y: midY))

            for x in stride(from: 0.0, to: size.width, by: 2) {
                let progress = x / size.width
                let frequency = Double(seed % 8 + 2)
                let y = midY + CGFloat(sin(progress * .pi * frequency + animatedPhase) * Double(amp))
                path.addLine(to: CGPoint(x: x, y: y))
            }

            context.stroke(path, with: .linearGradient(.init(colors: [.white.opacity(0.9), .white.opacity(0.2)]), startPoint: .zero, endPoint: CGPoint(x: size.width, y: size.height)), lineWidth: 3)
        }
        .frame(height: 120)
    }
}
