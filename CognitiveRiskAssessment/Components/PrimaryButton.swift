import SwiftUI

struct PrimaryButton: View {

    let title: String
    let action: () -> Void

    var body: some View {

        Button(action: action) {

            Text(title)
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(AppColors.teal)
                )

        }
        .buttonStyle(.plain)
    }
}


#Preview {
    PrimaryButton(title: "Estimate Cognitive Risk") {
        print("Button tapped")
    }
    .padding()
}
