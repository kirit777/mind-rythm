import SwiftUI

enum AppDesign {
    enum Colors {
        static let background = Color(hex: "#F3F4F7")
        static let card = Color.white
        static let textPrimary = Color(hex: "#1F2430")
        static let textSecondary = Color(hex: "#6E7688")

        static let teal = Color(hex: "#3396D3")
        static let green = Color(hex: "#38B492")
        static let blueAccent = Color(hex: "#2D9CDB")
        static let redAccent = Color(hex: "#E64C4C")
        static let orangeAccent = Color(hex: "#F5A623")
        static let greenAccent = Color(hex: "#2FAF8A")
    }

    enum Radius {
        static let card: CGFloat = 20
        static let button: CGFloat = 18
        static let pill: CGFloat = 999
    }

    enum Spacing {
        static let xs: CGFloat = 8
        static let sm: CGFloat = 12
        static let md: CGFloat = 16
        static let lg: CGFloat = 24
    }
}

extension View {
    func softCardShadow() -> some View {
        shadow(color: Color.black.opacity(0.08), radius: 10, x: 0, y: 4)
    }
}
