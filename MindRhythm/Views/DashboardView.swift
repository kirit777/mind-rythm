import SwiftUI

struct DashboardView: View {
    @EnvironmentObject private var vm: AppStateViewModel

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                GradientHeaderCard()
                hrvCard
                statGrid
                stressCard
            }
            .padding(.bottom, 20)
        }
    }

    var hrvCard: some View {
        VStack(spacing: 12) { Text("HRV 71 ms") }
            .frame(height: 250)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
            .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
            .padding(.horizontal, 16)
    }

    var statGrid: some View {
        LazyVGrid(columns: [.init(.flexible()), .init(.flexible())], spacing: 12) {
            stat("heart", "PULSS", "72", "bpm", Color(hex: "#FDEEEF"))
            stat("thermometer", "TEMPERATŪRA", "36.6", "°C", Color(hex: "#F6F1EC"))
            stat("wind", "SPO2", "98", "%", Color(hex: "#EAF4FF"))
            stat("figure.walk", "SOĻI", "4,832", "", Color(hex: "#EAF5F0"))
        }.padding(.horizontal, 16)
    }

    func stat(_ icon: String,_ title: String,_ value: String,_ unit: String,_ bg: Color) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: icon).foregroundStyle(Color(hex: "#248BE6"))
            Spacer()
            Text(title).font(.system(size: 12)).foregroundStyle(Color(hex: "#6B7384"))
            (Text(value).font(.system(size: 36, weight: .bold)) + Text(" \(unit)").font(.system(size: 18, weight: .medium))).foregroundStyle(Color(hex: "#1D2330"))
        }.padding(16).frame(height: 118).frame(maxWidth: .infinity, alignment: .leading).background(bg).clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    var stressCard: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack { Text("Stresa līmenis\n35%").font(.system(size: 18, weight: .semibold)); Spacer(); Text("🙂 Vidējs").foregroundStyle(Color(hex: "#F0A000")).font(.system(size: 30, weight: .semibold)) }
            GeometryReader { g in
                ZStack(alignment: .leading) {
                    Capsule().fill(Color(hex: "#D8DCE2"))
                    Capsule().fill(LinearGradient(colors: [Color(hex: "#F2B21A"), Color(hex: "#EAA205")], startPoint: .leading, endPoint: .trailing)).frame(width: g.size.width * 0.35)
                }
            }.frame(height: 10)
            HStack { Text("Zems"); Spacer(); Text("Vidējs"); Spacer(); Text("Augsts") }.font(.system(size: 13)).foregroundStyle(Color(hex: "#6F7688"))
        }.padding(20).background(.white).clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous)).padding(.horizontal, 16)
    }
}
