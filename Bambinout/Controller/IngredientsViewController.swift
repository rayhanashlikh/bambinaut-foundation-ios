
import UIKit


class IngredientsViewController: UIViewController {
    
    private var data: [UIImage] = []
    
    private let ingredientView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
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
//            var newData = IngredientData(
//                image: UIImage(named:"tomato")!,
//                name: "Tomat",
//                description: "Ini adalah tomat",
//                allergy_id: 1,
//                min_months: 6,
//                max_months: 8,
//                for_weight_status: -1
//            )
//            data.append(newData)
            data.append(UIImage(named: "avocado")!)
            data.append(UIImage(named: "avocado")!)
            data.append(UIImage(named: "avocado")!)
            data.append(UIImage(named: "avocado")!)
            data.append(UIImage(named: "avocado")!)
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
        
        let curr = self.data[indexPath.row]
        
        cell.configure(with: curr)
        
        return cell
    }
}

extension IngredientsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
