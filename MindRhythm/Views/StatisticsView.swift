import SwiftUI
struct StatisticsView: View { var body: some View { ScrollView{VStack(spacing:16){GradientHeaderCard();RoundedRectangle(cornerRadius:20).fill(.white).frame(height:500)}.padding(.horizontal,16).padding(.top,8)}.background(AppDesign.Colors.background)} }
