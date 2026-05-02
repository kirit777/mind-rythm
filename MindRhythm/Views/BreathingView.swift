import SwiftUI

struct BreathingView: View {
    @EnvironmentObject private var vm: AppStateViewModel

    var body: some View {
        VStack(spacing: 0) {
            GradientHeaderCard()
            Spacer()
            VStack(spacing: 14) {
                Text("Elpošanas vingrinājums").font(.system(size: 48, weight: .bold)).foregroundStyle(Color(hex: "#1E2331"))
                Text("4-4-4 tehnika stresa mazināšanai").font(.system(size: 18, weight: .regular)).foregroundStyle(Color(hex: "#6E788A"))
            }
            Spacer().frame(height: 70)
            Button { vm.startBreathing() } label: {
                Circle()
                    .fill(LinearGradient(colors: [Color(hex: "#9FC4E7"), Color(hex: "#ACA9E8")], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 140 * vm.breathingScale, height: 140 * vm.breathingScale)
                    .overlay(Image(systemName: vm.breathingActive ? "pause.fill" : "play.fill").font(.system(size: 34)).foregroundStyle(.white))
                    .shadow(color: Color(hex: "#A6B8E8").opacity(0.5), radius: 24, x: 0, y: 8)
            }
            .buttonStyle(.plain)
            Spacer().frame(height: 90)
            Text(vm.breathingPhaseText).font(.system(size: 31, weight: .medium)).foregroundStyle(Color(hex: "#6E788A"))
            Spacer()
        }
    }
}
