import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var vm: AppStateViewModel
    let sections = ["Personīgie dati", "Reproduktīvā veselība", "Emocionālā labsajūta", "Ārējie faktori"]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 14) {
                GradientHeaderCard()
                profileCard
                ForEach(sections, id: \.self) { section in
                    VStack(spacing: 0) {
                        Button {
                            withAnimation(.easeInOut(duration: 0.25)) { vm.toggleSection(section) }
                        } label: {
                            HStack {
                                Text(section).font(.system(size: 34, weight: .semibold)).foregroundStyle(Color(hex: "#1F2430"))
                                Spacer()
                                Image(systemName: "chevron.down").rotationEffect(.degrees(vm.expandedSections.contains(section) ? 180 : 0)).font(.system(size: 18, weight: .bold)).foregroundStyle(Color(hex: "#7A8293"))
                            }.padding(16)
                        }
                        if vm.expandedSections.contains(section), section == "Emocionālā labsajūta" { emotional }
                    }
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .padding(.horizontal, 16)
                }
            }
        }
    }

    var emotional: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Pašreizējā noskaņa").foregroundStyle(Color(hex: "#6B7385")).font(.system(size: 26))
            HStack(spacing: 8) {
                ForEach(MoodState.allCases) { mood in
                    Button {
                        withAnimation(.spring(response: 0.2, dampingFraction: 0.8)) { vm.selectedMood = mood }
                    } label: {
                        VStack(spacing: 8) { Text(mood.emoji).font(.system(size: 24)); Text(mood.label).font(.system(size: 13, weight: .medium)) }
                            .frame(maxWidth: .infinity).padding(.vertical, 12)
                            .background(vm.selectedMood == mood ? Color(hex: "#248BE6") : Color(hex: "#ECEFF3"))
                            .foregroundStyle(vm.selectedMood == mood ? .white : Color(hex: "#6B7385"))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .scaleEffect(vm.selectedMood == mood ? 1.05 : 1)
                    }
                }
            }
            Text("Enerģija: \(Int(vm.energy))/10").foregroundStyle(Color(hex: "#6B7385")).font(.system(size: 30))
            CustomSlider(value: $vm.energy, color: Color(hex: "#2E95D8"))
            Text("Stress: \(Int(vm.stress))/10").foregroundStyle(Color(hex: "#6B7385")).font(.system(size: 30))
            CustomSlider(value: $vm.stress, color: Color(hex: "#E14848"))
        }
        .padding(16)
    }

    var profileCard: some View {
        HStack(spacing: 14) {
            RoundedRectangle(cornerRadius: 18).fill(LinearGradient(colors: [Color(hex: "#2197E8"), Color(hex: "#14C9B8")], startPoint: .topLeading, endPoint: .bottomTrailing)).frame(width: 72, height: 72)
            VStack(alignment: .leading, spacing: 7) { Text("Anna").font(.system(size: 47, weight: .bold)); Text("34 gadi · 65 kg · 170 cm").font(.system(size: 17)).foregroundStyle(Color(hex: "#6E7788")) }
            Spacer()
        }.padding(16).background(.white).clipShape(RoundedRectangle(cornerRadius: 18)).padding(.horizontal, 16)
    }
}
