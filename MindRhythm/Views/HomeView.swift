import SwiftUI

struct HomeView: View {
    @State private var selectedTab: Tab = .overview

    var body: some View {
        ZStack {
            Color(hex: "#DBDCE0").ignoresSafeArea()

            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        header

                        switch selectedTab {
                        case .overview:
                            overviewContent
                        case .breath:
                            breathContent
                        case .stats:
                            statsContent
                        case .profile:
                            profileContent
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 0)
                    .padding(.bottom, 20)
                }

                tabBar
            }
            .frame(width: 450, maxHeight: .infinity)
            .background(Color(hex: "#E5E7EB"))
        }
    }

    private var header: some View {
        ZStack(alignment: .topLeading) {
            LinearGradient(colors: [Color(hex: "#3596D8"), Color(hex: "#36BA93")], startPoint: .topLeading, endPoint: .bottomTrailing)

            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Label("MoodCoach", systemImage: "waveform.path.ecg")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundStyle(.white)
                    Spacer()
                    Image(systemName: "bell")
                    Image(systemName: "line.3.horizontal")
                }
                .font(.title2)
                .foregroundStyle(.white)
                .padding(.top, 14)

                Text("LABDIEN, ANNA 👋")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(.white.opacity(0.75))
                Text("Vēro sevi un atrodi mieru")
                    .font(.system(size: 38, weight: .semibold))
                    .foregroundStyle(.white)
            }
            .padding(20)
        }
        .frame(height: 215)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }

    private var overviewContent: some View { Text("") }

    private var breathContent: some View {
        VStack(spacing: 24) {
            Spacer(minLength: 120)
            VStack(spacing: 4) {
                Text("Elpošanas vingrinājums").font(.system(size: 40, weight: .bold))
                Text("4-4-4 tehnika stresa mazināšanai").font(.system(size: 28)).foregroundStyle(.secondary)
            }
            Spacer(minLength: 70)
            Circle().fill(LinearGradient(colors: [Color(hex: "#A8D3F2"), Color(hex: "#BFA7EC")], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 128, height: 128)
                .overlay(Image(systemName: "play.fill").foregroundStyle(.white).font(.title))
            Spacer(minLength: 70)
            Text("Pieskarieties, lai sāktu").font(.system(size: 30)).foregroundStyle(.secondary)
            Spacer(minLength: 190)
        }
    }

    private var statsContent: some View {
        VStack(spacing: 14) {
            card(title: "Kopējās sesijas", value: "47")
            card(title: "Aktīvo dienu sērija", value: "12")
            card(title: "Šonedēļ", value: "5/7")
        }
    }

    private var profileContent: some View {
        VStack(spacing: 14) {
            RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.65)).frame(height: 114)
                .overlay(HStack { RoundedRectangle(cornerRadius: 16).fill(LinearGradient(colors: [.blue,.mint], startPoint: .top, endPoint: .bottom)).frame(width: 66, height: 66); VStack(alignment:.leading){Text("Anna").font(.title2.bold()); Text("34 gadi · 65 kg · 170 cm").foregroundStyle(.secondary)}; Spacer() }.padding())
            ForEach(["Personīgie dati", "Reproduktīvā veselība", "Emocionālā labsajūta", "Ārējie faktori"], id: \.self) { item in
                RoundedRectangle(cornerRadius: 18).fill(Color.white.opacity(0.65)).frame(height: 74)
                    .overlay(HStack { Text(item).font(.title3.weight(.semibold)); Spacer(); Image(systemName: "chevron.down") }.padding())
            }
        }
    }

    private var tabBar: some View {
        HStack {
            tabButton(.overview, icon: "waveform.path.ecg", title: "Pārskats")
            tabButton(.breath, icon: "wind", title: "Elpo")
            tabButton(.stats, icon: "chart.bar", title: "Statistika")
            tabButton(.profile, icon: "person", title: "Profils")
        }
        .padding(.vertical, 14)
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.6))
    }

    private func tabButton(_ tab: Tab, icon: String, title: String) -> some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(selectedTab == tab ? Color(hex: "#1E90EA") : .secondary)
            Text(title)
                .font(.caption)
                .foregroundStyle(selectedTab == tab ? Color(hex: "#1E90EA") : .secondary)
        }
        .frame(maxWidth: .infinity)
        .onTapGesture { selectedTab = tab }
    }

    private func card(title: String, value: String) -> some View {
        RoundedRectangle(cornerRadius: 18).fill(Color.white.opacity(0.65)).frame(height: 86)
            .overlay(VStack(alignment: .leading) { Text(value).font(.title.bold()); Text(title).foregroundStyle(.secondary) }.frame(maxWidth: .infinity, alignment: .leading).padding())
    }
}

private enum Tab {
    case overview, breath, stats, profile
}
