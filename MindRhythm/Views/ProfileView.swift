import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var vm: AppStateViewModel
    let sections = ["Personīgie dati", "Reproduktīvā veselība", "Emocionālā labsajūta", "Ārējie faktori"]
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                GradientHeaderCard()
                profileCard
                ForEach(sections, id: \ .self) { section in
                    VStack(spacing: 0) {
                        Button { vm.toggleSection(section) } label: {
                            HStack { Text(section).font(.system(size: 29/2, weight: .semibold)); Spacer(); Image(systemName: vm.expandedSections.contains(section) ? "chevron.up" : "chevron.down") }
                                .padding(16).foregroundStyle(AppDesign.Colors.textPrimary)
                        }
                        if vm.expandedSections.contains(section) && section == "Emocionālā labsajūta" {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Pašreizējā noskaņa").foregroundStyle(AppDesign.Colors.textSecondary)
                                HStack(spacing: 8) { ForEach(MoodState.allCases) { mood in
                                    Button { withAnimation(.spring()) { vm.selectedMood = mood } } label: { VStack{Text(mood.emoji);Text(mood.label).font(.caption2)}.frame(maxWidth: .infinity).padding(.vertical, 10).background(vm.selectedMood == mood ? AppDesign.Colors.blueAccent : Color.gray.opacity(0.12)).foregroundStyle(vm.selectedMood == mood ? .white : AppDesign.Colors.textSecondary).clipShape(RoundedRectangle(cornerRadius: 12)).scaleEffect(vm.selectedMood == mood ? 1.02 : 1) }
                                }}
                                Text("Enerģija: \(Int(vm.energy))/10").foregroundStyle(AppDesign.Colors.textSecondary)
                                CustomSlider(value: $vm.energy, color: AppDesign.Colors.blueAccent).frame(height: 16)
                                Text("Stress: \(Int(vm.stress))/10").foregroundStyle(AppDesign.Colors.textSecondary)
                                CustomSlider(value: $vm.stress, color: AppDesign.Colors.redAccent).frame(height: 16)
                            }.padding(16)
                        }
                    }.background(.white).clipShape(RoundedRectangle(cornerRadius: 20)).softCardShadow()
                }
            }.padding(.horizontal, 16).padding(.top, 8)
        }
    }

    var profileCard: some View {
        HStack(spacing: 14) {
            RoundedRectangle(cornerRadius: 14).fill(LinearGradient(colors:[AppDesign.Colors.teal, AppDesign.Colors.green], startPoint: .topLeading, endPoint: .bottomTrailing)).frame(width: 64, height: 64).overlay(Image(systemName: "person").foregroundStyle(.white))
            VStack(alignment: .leading, spacing: 6) { Text("Anna").font(.title3.bold()); Text("34 gadi · 65 kg · 170 cm").foregroundStyle(AppDesign.Colors.textSecondary) }
            Spacer()
        }.padding(16).background(.white).clipShape(RoundedRectangle(cornerRadius: 20)).softCardShadow()
    }
}
