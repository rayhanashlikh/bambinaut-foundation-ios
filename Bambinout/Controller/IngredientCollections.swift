import SwiftUI

struct IngredientCollections: UIViewControllerRepresentable {
    @Binding var search: String
    @Binding var babyData: BabyData
    
    func makeUIViewController(context: Context) -> IngredientsViewController {
        return IngredientsViewController(babyData: babyData)
    }

    func updateUIViewController(_ uiViewController: IngredientsViewController, context: Context) {
        uiViewController.updateSearchText(search)
    }
}
