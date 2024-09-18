
import UIKit
import SwiftUI

class IngredientsViewController: UIViewController {
    private var searchText: String = "" {
        didSet {
            filterData(name: searchText)
        }
    }
    private let margin: CGFloat = 16
    
    private var data: [IngredientData] = []
    private var filteredData: [IngredientData] = []
    private var babyData: BabyData;
    
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
    
    // Custom initializer
    init(babyData: BabyData) {
        self.babyData = babyData
        super.init(nibName: nil, bundle: nil)
    }
    
    // Required initializer for using storyboards or nib files
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        for _ in 0...5 {
            let newData1 = IngredientData(
                imageName: "tomato",
                name: "Tomato",
                description: "This is Tomato",
                allergy_id: 1,
                min_months: 8,
                max_months: 10,
                for_weight_status: 1
            )
            let newData2 = IngredientData(
                imageName: "avocado",
                name: "Avocado",
                description: "This is avocado",
                allergy_id: 2,
                min_months: 6,
                max_months: 8,
                for_weight_status: -1
            )
            let newData3 = IngredientData(
                imageName: "water",
                name: "Water",
                description: "This is water",
                allergy_id: 1,
                min_months: 10,
                max_months: 12,
                for_weight_status: -1
            )
            let newData4 = IngredientData(
                imageName: "banana",
                name: "Banana",
                description: "This is banana",
                allergy_id: 3,
                min_months: 6,
                max_months: 8,
                for_weight_status: -1
            )
            let newData5 = IngredientData(
                imageName: "chicken",
                name: "Chicken",
                description: "This is chicken",
                allergy_id: 1,
                min_months: 10,
                max_months: 12,
                for_weight_status: -1
            )
            data.append(newData1)
            data.append(newData2)
            data.append(newData3)
            data.append(newData4)
            data.append(newData5)
        }
        filterData(babyData: babyData)
        
        filteredData = data
        
        
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
    
    func filterData(name: String) {
    if name.isEmpty {
            filteredData = data
        } else {
            filteredData = data.filter { $0.name.lowercased().contains(name.lowercased()) }
        }
        ingredientView.reloadData()
    }
    
    func filterData(babyData: BabyData) {
        //filter by baby age
        print("filter bayi")
        
        print(data.count)
        
        data = data.filter {
            !babyData.allergy_ids.contains($0.allergy_id ?? 0) &&
            babyData.getAgeMonth() ?? 0 >= $0.min_months &&
            babyData.getAgeMonth() ?? 0 <= $0.max_months
//            babyData.getWeightStatus() != 0 ? $0.for_weight_status == babyData.getWeightStatus() : true
            
//            (babyData.latest_weight >= getBabyOptimalWeightRange(age: babyData.getAgeMonth() ?? 0, gender: babyData.gender).min
//            &&
//            babyData.latest_weight <= getBabyOptimalWeightRange(age: babyData.getAgeMonth() ?? 0, gender: babyData.gender).max) ?
//            true : babyData.latest_weight <= getBabyOptimalWeightRange(age: babyData.getAgeMonth() ?? 0, gender: babyData.gender).min ?
//            $0.for_weight_status == -1 : babyData.latest_weight >= getBabyOptimalWeightRange(age: babyData.getAgeMonth() ?? 0, gender: babyData.gender).max ? $0.for_weight_status == 1 : false
//            ( babyData.latest_weight >= getBabyOptimalWeightRange(age: babyData.getAgeMonth() ?? 0, gender: babyData.gender).min &&
//              babyData.latest_weight <= getBabyOptimalWeightRange(age: babyData.getAgeMonth() ?? 0, gender: babyData.gender).min
//            ) {
//                return true
//            }
        }
        print(data.count)
        
        
        ingredientView.reloadData()
        
    }
    
    func updateSearchText(_ searchText: String) {
        self.searchText = searchText
    }
}

extension IngredientsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.filteredData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = ingredientView.dequeueReusableCell(withReuseIdentifier:
            IngredientsCollectionViewCell.identifier, for: indexPath) as?
            IngredientsCollectionViewCell else {
            fatalError("Failed to dequeue IngredientsCollectionViewCell in IngredientsViewController")
        }
        let ingredient = self.filteredData[indexPath.row]
        
        cell.layer.cornerRadius = 20.0
        cell.clipsToBounds = true
        
        cell.configure(with: ingredient)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            // Get the selected ingredient
            let ingredient = self.filteredData[indexPath.row]
            
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
