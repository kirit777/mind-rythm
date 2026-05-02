import SwiftUI

struct GradientHeaderCard: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(hex: "#3797D5"), Color(hex: "#39B69B")], startPoint: .leading, endPoint: .trailing)
            Circle().fill(Color.white.opacity(0.06)).frame(width: 220, height: 220).offset(x: 120, y: -92)
            Circle().fill(Color.white.opacity(0.05)).frame(width: 100, height: 100).offset(x: -170, y: 80)

            VStack(alignment: .leading, spacing: 14) {
                HStack(alignment: .center) {
                    Image(systemName: "waveform.path.ecg")
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundStyle(.white)
                    Text("MoodCoach")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundStyle(.white)
                    Spacer()
                    Image(systemName: "bell")
                        .font(.system(size: 18, weight: .regular))
                        .foregroundStyle(.white)
                    Image(systemName: "line.3.horizontal")
                        .font(.system(size: 26, weight: .regular))
                        .foregroundStyle(.white)
                }
                Text("LABDIEN, ANNA 👋")
                    .font(.system(size: 21, weight: .medium))
                    .foregroundStyle(Color.white.opacity(0.68))
                    .tracking(0.7)
                Text("Vēro sevi un atrodi m…")
                    .font(.system(size: 70, weight: .bold))
                    .lineLimit(2)
                    .minimumScaleFactor(0.65)
                    .foregroundStyle(.white)
                    .offset(y: -4)
            }
            .padding(.horizontal, 30)
            .padding(.top, 96)
            .padding(.bottom, 34)
        }
        .frame(height: 520)
        .clipShape(.rect(topLeadingRadius: 0, bottomLeadingRadius: 48, bottomTrailingRadius: 48, topTrailingRadius: 0))
    }
}

struct CustomSlider: View {
    @Binding var value: Double
    let color: Color

    var body: some View {
        GeometryReader { geo in
            let knobX = max(9, min(geo.size.width - 9, (value / 10) * geo.size.width))
            ZStack(alignment: .leading) {
                Capsule().fill(Color(hex: "#DEE1E7")).frame(height: 8)
                Capsule().fill(color.opacity(0.25)).frame(width: knobX, height: 8)
                Circle().fill(color).frame(width: 18, height: 18).shadow(color: .black.opacity(0.12), radius: 5, x: 0, y: 2).position(x: knobX, y: 4)
            }
            .contentShape(Rectangle())
            .gesture(DragGesture(minimumDistance: 0).onChanged { g in
                let x = min(max(0, g.location.x), geo.size.width)
                value = (x / geo.size.width) * 10
            })
        }
        .frame(height: 20)
    }
}
