//
//  IngredientsController.swift
//  Bambinout
//
//  Created by MacBook Air on 18/09/24.
//
import UIKit
import SwiftUI

class IngredientsController: UIViewController {
    private var searchText: String = "" {
        didSet {
            filterData(foodMonthData: self.foodMonthData, name: searchText)
        }
    }
    private var foodMonthData: FoodMonthRange{
        didSet {
            filterData(foodMonthData: foodMonthData, name: self.searchText)
        }
    }
    private let margin: CGFloat = 16
    
    private var data: [IngredientData] = []
    private var filteredData: [IngredientData] = []
    //private var babyData: BabyData;
    
    private lazy var ingredientView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: margin, left:  margin, bottom:  margin, right:  margin)
        
        let ingredientView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        ingredientView.backgroundColor = .systemBackground
        ingredientView.register(
            IngredientsCollectionsviewCell.self,
            forCellWithReuseIdentifier: IngredientsCollectionsviewCell.identifier
        )
        return ingredientView
    }()
    
    // Custom initializer
    init(foodMonthData: FoodMonthRange) {
        self.foodMonthData = foodMonthData
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
       // filterData(babyData: babyData)
        
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
    
//    func filterData(name: String) {
//        print(foodMonthData)
//        filterData(foodMonthData: foodMonthData)
//        print(filteredData.count)
//        if name.isEmpty {
//          //  filteredData = data
//        } else {
//            let temp = filteredData.filter { $0.name.lowercased().contains(name.lowercased()) }
//            print("temp: ", temp.count)
//            filteredData = temp
//        }
////        DispatchQueue.main.async {
//            self.ingredientView.reloadData() // Ensure this reloads the UI correctly
////        }
//    }
    

    func filterData(foodMonthData: FoodMonthRange, name: String) {
//        print("Filtering ingredients...")

        // Filter by baby age
        if foodMonthData.min == nil && foodMonthData.max == nil {
            
            if !name.isEmpty {
                filteredData = getDummyIngredients(n: 5).filter { ingredient in
                    (name.isEmpty || ingredient.name.lowercased().contains(name.lowercased()))
                }
            }else {
                filteredData = getDummyIngredients(n: 5) // or your full data set
            }
        } else {
            filteredData = getDummyIngredients(n: 5).filter { ingredient in
                (ingredient.min_months >= foodMonthData.min ?? 0) &&
                (ingredient.max_months <= foodMonthData.max ?? Int.max) &&
                (name.isEmpty || ingredient.name.lowercased().contains(name.lowercased()))
                
            }
        }

//        print("Filtered data count: \(data.count)")

        // Assuming `ingredientView` is an observable object that updates the view
        //DispatchQueue.main.async {
            self.ingredientView.reloadData() // Ensure this reloads the UI correctly
        //}
    }

    
    func updateSearchText(_ searchText: String) {
        self.searchText = searchText
    }
    func updateFoodMonthData(_ foodMonthData: FoodMonthRange) {
        self.foodMonthData = foodMonthData
    }
}

extension IngredientsController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.filteredData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = ingredientView.dequeueReusableCell(withReuseIdentifier:
                                                                IngredientsCollectionsviewCell.identifier, for: indexPath) as?
                IngredientsCollectionsviewCell else {
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
//            let detailView = IngredientDetailView(ingredient: ingredient)
            
            // Create a UIHostingController with the SwiftUI view
//            let hostingController = UIHostingController(rootView: detailView)
//            
//            // Push the hostingController onto the navigation stack
//            self.navigationController?.pushViewController(hostingController, animated: true)
        }
}

extension IngredientsController: UICollectionViewDelegateFlowLayout {
    
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
