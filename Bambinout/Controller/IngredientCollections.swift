import SwiftUI

struct IngredientCollections: UIViewControllerRepresentable {
   @Binding var search: String
    
    func makeUIViewController(context: Context) -> IngredientsViewController {
        return IngredientsViewController()
    }

    func updateUIViewController(_ uiViewController: IngredientsViewController, context: Context) {
        uiViewController.updateSearchText(search)
    }
}
