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
            customTabBar
        }
        .background(AppDesign.Colors.background.ignoresSafeArea())
    }

    var customTabBar: some View {
        HStack {
            ForEach(TabItem.allCases, id: \ .self) { tab in
                Button {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) { vm.selectedTab = tab }
                } label: {
                    VStack(spacing: 8) {
                        Image(systemName: tab.icon).frame(width: 34, height: 34)
                            .background(vm.selectedTab == tab ? AppDesign.Colors.blueAccent.opacity(0.15) : .clear)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        Text(tab.rawValue).font(.system(size: 12, weight: .medium))
                    }
                    .foregroundStyle(vm.selectedTab == tab ? AppDesign.Colors.blueAccent : AppDesign.Colors.textSecondary)
                    .frame(maxWidth: .infinity)
                }
            }
        }.padding(.horizontal, 20).padding(.vertical, 12).background(Color.white)
    }
}
