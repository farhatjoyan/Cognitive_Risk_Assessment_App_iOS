import SwiftUI

struct AppHeaderView: View {

    var body: some View {

        VStack(spacing: 12) {

            Image(systemName: "brain.head.profile")
                .font(.system(size: 52))
                .foregroundStyle(AppColors.teal)

            Text("Cognitive Risk Assessment")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)

            Text("UNCW School of Nursing")
                .font(.headline)
                .foregroundStyle(AppColors.navy)

            Text("Complete the assessment below to estimate cognitive risk.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)

        }
        .padding(.vertical, 10)
    }
}

#Preview {
    AppHeaderView()
}
