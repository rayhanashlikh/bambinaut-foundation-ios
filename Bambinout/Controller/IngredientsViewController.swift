
import UIKit
import SwiftUI

class IngredientsViewController: UIViewController {
    
    private let margin: CGFloat = 16
    
    private var data: [IngredientData] = []
    
    private lazy var ingredientView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: margin, left:  margin, bottom:  margin, right:  margin)
        
        let ingredientView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        ingredientView.backgroundColor = .systemBackground
        ingredientView.register(
            IngredientsCollectionViewCell.self,
            forCellWithReuseIdentifier: IngredientsCollectionViewCell.identifier
        )
        return ingredientView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        for _ in 0...25 {
            let newData = IngredientData(
                imageName: "tomato",
                name: "Tomato",
                description: "Ini adalah tomat",
                allergy_id: 1,
                min_months: 6,
                max_months: 8,
                for_weight_status: -1
            )
            data.append(newData)
        }
        
        self.ingredientView.dataSource = self
        self.ingredientView.delegate = self
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(ingredientView)
        ingredientView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ingredientView.topAnchor.constraint(equalTo: self.view.topAnchor),
            ingredientView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            ingredientView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            ingredientView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
}

extension IngredientsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = ingredientView.dequeueReusableCell(withReuseIdentifier:
            IngredientsCollectionViewCell.identifier, for: indexPath) as?
            IngredientsCollectionViewCell else {
            fatalError("Failed to dequeue IngredientsCollectionViewCell in IngredientsViewController")
        }
        let ingredient = self.data[indexPath.row]
        
        cell.layer.cornerRadius = 20.0
        cell.clipsToBounds = true
        
        cell.configure(with: ingredient)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            // Get the selected ingredient
            let ingredient = self.data[indexPath.row]
            
            // Create the SwiftUI view with the selected ingredient
            let detailView = IngredientDetailView(ingredient: ingredient)
            
            // Create a UIHostingController with the SwiftUI view
            let hostingController = UIHostingController(rootView: detailView)
            
            // Push the hostingController onto the navigation stack
            self.navigationController?.pushViewController(hostingController, animated: true)
        }
}

extension IngredientsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Calculate the width of each item
        let totalSpacing = (collectionViewLayout as! UICollectionViewFlowLayout).minimumInteritemSpacing * 1 // 1 space between items
        let contentWidth = collectionView.bounds.width
        let itemWidth = (contentWidth - (margin * 2) - totalSpacing) / 2.0
        let itemHeight = itemWidth + 40
        // Set a height for the items, or calculate dynamically if needed
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
