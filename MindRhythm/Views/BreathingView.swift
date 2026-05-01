import SwiftUI

struct BreathingView: View {
    @EnvironmentObject private var vm: AppStateViewModel
    var body: some View {
        VStack(spacing: 0) {
            GradientHeaderCard().padding(.horizontal, 16).padding(.top, 8)
            Spacer()
            VStack(spacing: 20) {
                Text("Elpošanas vingrinājums").font(.system(size: 40/2, weight: .bold))
                Text("4-4-4 tehnika stresa mazināšanai").foregroundStyle(AppDesign.Colors.textSecondary)
                Button { vm.startBreathing() } label: {
                    Circle().fill(LinearGradient(colors:[Color(hex:"#A5C8E8"),Color(hex:"#B0A3E8")], startPoint:.topLeading, endPoint:.bottomTrailing)).frame(width: 96 * vm.breathingScale, height: 96 * vm.breathingScale)
                        .overlay(Image(systemName: vm.breathingActive ? "pause.fill" : "play.fill").foregroundStyle(.white))
                }.padding(.top, 54)
                Text(vm.breathingPhaseText).font(.system(size: 30/2)).foregroundStyle(AppDesign.Colors.textSecondary).padding(.top, 54)
            }
            Spacer()
        }
    }
}
