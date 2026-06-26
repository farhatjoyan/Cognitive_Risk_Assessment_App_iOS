import SwiftUI

struct AppHeaderView: View {

    var body: some View {

        VStack(spacing: 16) {

            Image(systemName: "brain.head.profile")
                .font(.system(size: 54, weight: .light))
                .foregroundStyle(AppColors.teal)

            VStack(spacing: 6) {

                Text("Cognitive Risk Assessment")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                Text("Complete the assessment below to estimate cognitive risk.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }

            Text("University of North Carolina Wilmington")
                .font(.footnote)
                .foregroundStyle(AppColors.navy)
                .fontWeight(.medium)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
    }
}
