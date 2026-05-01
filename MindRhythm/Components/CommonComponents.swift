import SwiftUI

struct GradientHeaderCard: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            LinearGradient(colors: [AppDesign.Colors.teal, AppDesign.Colors.green], startPoint: .topLeading, endPoint: .bottomTrailing)
            Circle().fill(Color.white.opacity(0.07)).frame(width: 160)
                .offset(x: 52, y: -42)
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Label("MoodCoach", systemImage: "waveform.path.ecg")
                        .font(.system(size: 36/2, weight: .bold))
                        .foregroundStyle(.white)
                    Spacer()
                    icon("bell")
                    icon("line.3.horizontal")
                }
                Text("LABDIEN, ANNA 👋")
                    .font(.system(size: 25/2, weight: .medium))
                    .foregroundStyle(.white.opacity(0.72))
                Text("Vēro sevi un atrodi mieru")
                    .font(.system(size: 45/2, weight: .bold))
                    .foregroundStyle(.white)
            }.padding(20)
        }
        .frame(height: 184)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }

    private func icon(_ name: String) -> some View {
        Image(systemName: name).foregroundStyle(.white).frame(width: 38, height: 38).background(.white.opacity(0.14)).clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

struct CustomSlider: View {
    @Binding var value: Double
    var color: Color

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Capsule().fill(Color.gray.opacity(0.18)).frame(height: 6)
                Capsule().fill(color).frame(width: geo.size.width * (value / 10), height: 6)
                Circle().fill(color).frame(width: 14, height: 14).offset(x: geo.size.width * (value / 10) - 7)
                    .gesture(DragGesture(minimumDistance: 0).onChanged { g in
                        value = min(10, max(0, g.location.x / geo.size.width * 10))
                    })
            }
        }.frame(height: 14)
    }
}
