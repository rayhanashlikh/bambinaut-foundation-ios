import UIKit
import SwiftUI

class ForYouCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "IngredientCollectionViewCell"
    
    // Create a container view for the background color
    private let backgroundContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.backgroundColor = .white // Set your desired background color
        return view
    }()
    
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

        // Add the background container
        addSubview(backgroundContainer)

        // Add other subviews
        backgroundContainer.addSubview(myImageView)
        addSubview(button)
        
        backgroundContainer.translatesAutoresizingMaskIntoConstraints = false
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Position the background container
            backgroundContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            backgroundContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            backgroundContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            backgroundContainer.heightAnchor.constraint(equalTo: backgroundContainer.widthAnchor),

            // Position the image view within the container with 5px padding
            myImageView.topAnchor.constraint(equalTo: backgroundContainer.topAnchor, constant: 10),
            myImageView.leadingAnchor.constraint(equalTo: backgroundContainer.leadingAnchor, constant: 10),
            myImageView.trailingAnchor.constraint(equalTo: backgroundContainer.trailingAnchor, constant: -10),
            myImageView.bottomAnchor.constraint(equalTo: backgroundContainer.bottomAnchor, constant: -10),
                        
            // Position the button as before
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -16),
            button.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 8),
            button.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -8),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.myImageView.image = nil
        self.button.titleLabel?.text = ""
    }
}
