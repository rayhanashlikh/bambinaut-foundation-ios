//
//  IngredientsCollectionsviewCell.swift
//  Bambinout
//
//  Created by MacBook Air on 18/09/24.
//

//import SwiftUI
import UIKit

class IngredientsCollectionsviewCell: UICollectionViewCell {
    static let identifier = "IngredientCollectionViewCell"
    
    private let myImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .white
        iv.clipsToBounds = true
        return iv
    }()
        
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
//    private let button: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = UIColor(hexString: AppColors.peach)
//        return button
//    }()
    
    public func configure (with data: IngredientData) {
        self.myImageView.image = UIImage(named: data.imageName)
        self.titleLabel.text = data.name
        self.setupUI()
    }
    
    private func setupUI() {
        self.backgroundColor = UIColor(hexString: AppColors.lightBlue)
        self.myImageView.layer.cornerRadius = 16
//        self.contentView.layer.masksToBounds = true
        self.contentView.clipsToBounds = true
//        self.clipsToBounds = true
//        self.contentView.
//        self.contentView.layer.cornerRadius = 20.0
//        self.contentView.layer.borderWidth = 1.0
        
        self.addSubview(myImageView)
        self.addSubview(titleLabel)
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            myImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            myImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            myImageView.heightAnchor.constraint(equalTo: myImageView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 12),
                    titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor), // Center titleLabel horizontally
                    titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 8),
                    titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -8),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.myImageView.image = nil
        self.titleLabel.text = ""
    }
}
