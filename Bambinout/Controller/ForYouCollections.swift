import SwiftUI

struct ForYouCollections: UIViewControllerRepresentable {
    @Binding var search: String
    @Binding var babyData: BabyData
    
    func makeUIViewController(context: Context) -> ForYouViewController {
        return ForYouViewController(babyData: babyData)
    }

    func updateUIViewController(_ uiViewController: ForYouViewController, context: Context) {
        uiViewController.updateSearchText(search)
    }
}
