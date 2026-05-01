import SwiftUI

struct DashboardView: View {
    @EnvironmentObject private var vm: AppStateViewModel
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                GradientHeaderCard()
                hrvCard
                LazyVGrid(columns: [.init(.flexible()), .init(.flexible())], spacing: 12) {
                    stat("PULSS", "72", "bpm", "heart", .red)
                    stat("TEMPERATŪRA", "36.6", "°C", "thermometer", .orange)
                    stat("SPO2", "98", "%", "wind", .blue)
                    stat("SOĻI", "4,832", "", "figure.walk", .green)
                }
                stressCard
            }.padding(.horizontal, 16).padding(.top, 8)
        }
    }
    var hrvCard: some View { RoundedRectangle(cornerRadius: 20).fill(Color.white).frame(height: 240).overlay(Text("HRV chart")).softCardShadow() }
    var stressCard: some View { RoundedRectangle(cornerRadius: 20).fill(Color.white).frame(height: 130).overlay(Text("Stress 35%")) }
    func stat(_ t:String,_ v:String,_ u:String,_ i:String,_ c:Color)->some View { RoundedRectangle(cornerRadius: 18).fill(c.opacity(0.08)).frame(height: 118).overlay(VStack(alignment:.leading){Image(systemName:i);Text(t).font(.caption);Text(v+" "+u).font(.title3.bold())}.padding()) }
}
