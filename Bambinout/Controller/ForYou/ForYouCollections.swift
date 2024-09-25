import SwiftUI

struct ForYouCollections: UIViewControllerRepresentable {
//    var babyData: Baby
    
    @Binding var data: [Ingredient]
    var search: String
    
    func makeUIViewController(context: Context) -> ForYouViewController {
        return ForYouViewController(data: data, search: search)
    }

    func updateUIViewController(_ uiViewController: ForYouViewController, context: Context) {
        uiViewController.updateSearchText(search)
        uiViewController.updateData(data)
    }
}
