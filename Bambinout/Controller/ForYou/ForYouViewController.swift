
import UIKit
import SwiftUI

class ForYouViewController: UIViewController {
    private var searchText: String = "" {
        didSet {
            filterData(name: searchText)
        }
    }
//    private let margin: CGFloat = 16
    
    private var data: [IngredientData] = []
    private var filteredData: [IngredientData] = []
    private var babyData: BabyData;
    
    private var forYouView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 16, left:  16, bottom:  16, right:  16)
        
        let forYouView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        forYouView.backgroundColor = .systemBackground
        forYouView.register(
            ForYouCollectionViewCell.self,
            forCellWithReuseIdentifier: ForYouCollectionViewCell.identifier
        )
        return forYouView
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
        
        data = getDummyIngredients(n: 5)
        filterData(babyData: babyData)
        
        filteredData = data
        
        
        self.forYouView.dataSource = self
        self.forYouView.delegate = self
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(forYouView)
        forYouView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            forYouView.topAnchor.constraint(equalTo: self.view.topAnchor),
            forYouView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            forYouView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            forYouView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    
    func filterData(name: String) {
    if name.isEmpty {
            filteredData = data
        } else {
            filteredData = data.filter { $0.name.lowercased().contains(name.lowercased()) }
        }
        forYouView.reloadData()
    }
    
    func filterData(babyData: BabyData) {
        //filter by baby age
        print("filter bayi")
        
        print(babyData)
        print(babyData.getWeightStatus())
        
        data = data.filter {
            !babyData.allergy_ids.contains($0.allergy_id ?? 0) &&
            babyData.getAgeMonth() ?? 0 >= $0.min_months &&
            babyData.getAgeMonth() ?? 0 <= $0.max_months &&
            (babyData.getWeightStatus() != 0 ? $0.for_weight_status == babyData.getWeightStatus() : true)
            
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
        
        
        forYouView.reloadData()
        
    }
    
    func updateSearchText(_ searchText: String) {
        self.searchText = searchText
    }
}

extension ForYouViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.filteredData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = forYouView.dequeueReusableCell(withReuseIdentifier:
            ForYouCollectionViewCell.identifier, for: indexPath) as?
            ForYouCollectionViewCell else {
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

extension ForYouViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Calculate the width of each item
        let totalSpacing = (collectionViewLayout as! UICollectionViewFlowLayout).minimumInteritemSpacing * 1 // 1 space between items
        let contentWidth = collectionView.bounds.width
        let itemWidth = (contentWidth - (16 * 2) - totalSpacing) / 2.0
        let itemHeight = itemWidth + 40
        // Set a height for the items, or calculate dynamically if needed
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
