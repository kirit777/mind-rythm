import SwiftUI

struct StatisticsView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 14) {
                GradientHeaderCard()
                LazyVGrid(columns: [.init(.flexible()), .init(.flexible())], spacing: 12) {
                    mini("target", "47", "Kopējās sesijas")
                    mini("flame", "12", "Aktīvo dienu sērija")
                    mini("calendar", "5/7", "Šonedēļ")
                    mini("rosette", "8", "Sasniegumi")
                }.padding(.horizontal, 16)
                avgCard
                advice
            }
        }
    }

    func mini(_ i:String,_ v:String,_ t:String)->some View { VStack(alignment:.leading,spacing:10){Image(systemName:i);Text(v).font(.system(size:42,weight:.bold));Text(t).foregroundStyle(Color(hex:"#6B7385"))}.padding(16).frame(height:140).frame(maxWidth:.infinity,alignment:.leading).background(.white).clipShape(RoundedRectangle(cornerRadius:18)) }

    var avgCard: some View { VStack(alignment:.leading,spacing:14){Text("Vidējie rādītāji (30 dienas)").font(.system(size:32,weight:.semibold)); row("HRV","58 ms","+8%",true); Divider(); row("Pulss","72 bpm","-3%",false); Divider(); row("Stress","34%","-12%",true)}.padding(20).background(.white).clipShape(RoundedRectangle(cornerRadius:20)).padding(.horizontal,16) }
    func row(_ a:String,_ b:String,_ c:String,_ g:Bool)->some View { HStack{VStack(alignment:.leading){Text(a).foregroundStyle(Color(hex:"#6B7385"));Text(b).font(.system(size:38,weight:.bold))};Spacer();Text("↝ \(c)").font(.system(size:24,weight:.semibold)).padding(.horizontal,14).padding(.vertical,7).background((g ? Color(hex:"#E4F5EF") : Color(hex:"#FBE6E7"))).clipShape(Capsule()).foregroundStyle(g ? Color(hex:"#27A685") : Color(hex:"#DF4A4A"))} }
    var advice: some View { VStack(alignment:.leading,spacing:8){Text("💡 Personalizēts padoms").foregroundStyle(Color(hex:"#3A9D83")).font(.system(size:18,weight:.semibold));Text("Jūsu HRV uzlabojas! Turpiniet regulārus elpošanas vingrinājumus un mēģiniet iet gulēt pirms 23:00.").font(.system(size:31)).foregroundStyle(Color(hex:"#2A3340"))}.padding(16).background(Color(hex:"#E8F5EF")).clipShape(RoundedRectangle(cornerRadius:18)).padding(.horizontal,16) }
}
