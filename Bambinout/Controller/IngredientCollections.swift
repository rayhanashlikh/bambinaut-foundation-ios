import SwiftUI

struct IngredientCollections: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> IngredientsViewController {
        return IngredientsViewController()
    }

    func updateUIViewController(_ uiViewController: IngredientsViewController, context: Context) {
        // Update the view controller if needed
    }
}
