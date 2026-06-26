import SwiftUI

struct SectionHeaderView: View {

    let title: String
    let icon: String
    let color: Color

    var body: some View {

        HStack(spacing: 10) {

            Image(systemName: icon)
                .font(.headline)

            Text(title)
                .font(.headline)
                .fontWeight(.semibold)

            Spacer()

        }
        .foregroundStyle(color)
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(color.opacity(0.12))
        )
    }
}

#Preview {
    SectionHeaderView(
        title: "Demographics",
        icon: "person.fill",
        color: AppColors.teal
    )
    .padding()
}
