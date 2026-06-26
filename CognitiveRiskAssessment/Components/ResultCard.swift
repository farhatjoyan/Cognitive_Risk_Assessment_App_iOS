import SwiftUI

struct ResultCard: View {

    let percentage: Int
    let tier: String
    let note: String
    let color: Color

    var body: some View {

        VStack(spacing: 24) {

            // MARK: Header

            VStack(spacing: 10) {

                Text("Risk Assessment")
                    .font(.headline)
                    .foregroundStyle(AppColors.navy)

                Text(tier)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 7)
                    .background(color.opacity(0.15))
                    .foregroundStyle(color)
                    .clipShape(Capsule())
            }

            // MARK: Progress Ring

            ZStack {

                Circle()
                    .stroke(Color.gray.opacity(0.15), lineWidth: 12)

                Circle()
                    .trim(from: 0, to: CGFloat(percentage) / 100)
                    .stroke(
                        color,
                        style: StrokeStyle(
                            lineWidth: 12,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                    .animation(.easeOut(duration: 1), value: percentage)

                VStack(spacing: -2) {

                    Text("\(percentage)")
                        .font(.system(size: 44, weight: .bold))

                    Text("%")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                }

            }
            .frame(width: 170, height: 170)

            // MARK: Explanation

            Text(note)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Divider()

            // MARK: Disclaimer

            Text("""
            This assessment is intended as a research and screening aid. \
            It does not diagnose dementia and should not replace professional \
            medical evaluation or clinical judgment.
            """)
            .font(.caption)
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)

        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 22)
                .fill(Color(.systemBackground))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(AppColors.teal.opacity(0.15), lineWidth: 1)
        )
        .shadow(
            color: .black.opacity(0.08),
            radius: 10,
            x: 0,
            y: 5
        )
    }
}
