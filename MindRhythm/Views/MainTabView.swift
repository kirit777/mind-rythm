import SwiftUI

struct MainTabView: View {
    @EnvironmentObject private var vm: AppStateViewModel

    var body: some View {
        VStack(spacing: 0) {
            Group {
                switch vm.selectedTab {
                case .dashboard: DashboardView()
                case .breathing: BreathingView()
                case .statistics: StatisticsView()
                case .profile: ProfileView()
                }
            }
            tabBar
        }
        .background(AppDesign.Colors.background.ignoresSafeArea())
    }

    var tabBar: some View {
        HStack {
            ForEach(TabItem.allCases, id: \.self) { tab in
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) { vm.selectedTab = tab }
                } label: {
                    VStack(spacing: 7) {
                        Image(systemName: tab.icon)
                            .font(.system(size: 25, weight: .regular))
                        Text(tab.rawValue)
                            .font(.system(size: 15, weight: .medium))
                    }
                    .foregroundStyle(vm.selectedTab == tab ? Color(hex: "#248BE6") : Color(hex: "#6E788B").opacity(0.9))
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.horizontal, 18)
        .padding(.top, 14)
        .padding(.bottom, 16)
        .background(Color.white.opacity(0.98))
    }
}
