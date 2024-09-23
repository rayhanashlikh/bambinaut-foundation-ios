//
//  IngredientsCollectionViewCell.swift
//  bambinaut-foundation-ios
//
//  Created by MacBook Air on 13/09/24.
//

import UIKit
import SwiftUI

class ForYouCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "IngredientCollectionViewCell"
    
    private let myImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .white
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 16
        return iv
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "button-color")
        button.isUserInteractionEnabled = false
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 16
        return button
    }()
    
    public func configure (with data: IngredientData) {
        self.myImageView.image = UIImage(named: data.imageName)
        self.button.setTitle(data.name, for:.normal)
        self.setupUI()
    }
    
    private func setupUI() {
        self.backgroundColor = UIColor(hexString: AppColors.lightBlue)
        self.contentView.clipsToBounds = true
        
        self.addSubview(myImageView)
        self.addSubview(button)
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            myImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            myImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            myImageView.heightAnchor.constraint(equalTo: myImageView.widthAnchor),
            
            button.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 6),
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -16),
            button.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 8),
            button.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -8),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.myImageView.image = nil
        self.button.titleLabel?.text = ""
    }
}
