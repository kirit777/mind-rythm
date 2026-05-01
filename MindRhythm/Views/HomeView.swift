import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: AppStateViewModel
    @State private var phase: Double = 0

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(hex: "#020617"), Color(hex: "#111827"), Color(hex: "#1E1B4B")], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    header
                    sessionCard
                    presetsSection
                    historyCard
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 18)
            }
        }
        .onAppear {
            withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                phase = .pi * 2
            }
        }
    }

    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("MoodCoach")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                Text("Tune your mind rhythm")
                    .foregroundStyle(.white.opacity(0.7))
            }
            Spacer()
        }
    }

    private var sessionCard: some View {
        GlassCard {
            VStack(spacing: 14) {
                HStack {
                    Text(vm.selectedPreset?.title ?? "Session")
                        .font(.title2.weight(.semibold))
                    Spacer()
                    Text("\(Int(vm.progress * 100))%")
                }
                .foregroundStyle(.white)

                WaveformView(seed: vm.selectedPreset?.waveformSeed ?? 12, intensity: vm.intensity, animatedPhase: phase)
                ProgressView(value: vm.progress)
                    .tint(.white)
                IntensitySlider(value: $vm.intensity)
                Toggle("Ambient Layer", isOn: $vm.ambientEnabled)
                    .tint(.purple)
                    .foregroundStyle(.white)

                Button(action: vm.toggleSession) {
                    Text(vm.isSessionActive ? "Stop Session" : "Start Session")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                }
            }
        }
    }

    private var presetsSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Presets")
                .foregroundStyle(.white)
                .font(.headline)
            ForEach(vm.presets) { preset in
                Button {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                        vm.selectedPreset = preset
                        vm.progress = 0
                    }
                } label: {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(preset.title).fontWeight(.semibold)
                            Text(preset.subtitle).font(.caption).opacity(0.7)
                        }
                        Spacer()
                        Text("\(preset.durationMinutes)m")
                    }
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(LinearGradient(colors: [Color(hex: preset.gradientStartHex), Color(hex: preset.gradientEndHex)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(vm.selectedPreset == preset ? Color.white : Color.clear, lineWidth: 1.5)
                    )
                    .scaleEffect(vm.selectedPreset == preset ? 1.01 : 1)
                }
                .buttonStyle(.plain)
            }
        }
    }

    private var historyCard: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 8) {
                Text("Weekly Rhythm")
                    .foregroundStyle(.white)
                    .font(.headline)
                ForEach(vm.checkIns) { check in
                    HStack {
                        Text(check.date, style: .date)
                        Spacer()
                        Text(check.mood)
                        Text("F\(check.focus) C\(check.calm)")
                            .foregroundStyle(.white.opacity(0.65))
                    }
                    .font(.caption)
                    .foregroundStyle(.white)
                }
            }
        }
    }
}
