//
//  CatalogueCell.swift
//  machine-learning-yolo-tinyv3
//
//  Created by Tim Acosta on 17/4/21.
//

import UIKit

class CatalogueCell: UICollectionViewCell {
  
  static let catalogueCellIdentifier = "catalogueCell"
  
  lazy var catalogueImage: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.contentMode = .scaleAspectFill
    image.clipsToBounds = true
    image.layer.cornerRadius = 20
    return image
    
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(catalogueImage)
    
    NSLayoutConstraint.activate([
      catalogueImage.topAnchor.constraint(equalTo: contentView.topAnchor),
      catalogueImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
      catalogueImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
      catalogueImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  /*func configure(with imagePath: String) {
    guard let imageURL: URL = URL(string: imagePath) else { return }
    
    DispatchQueue.global(qos: .userInitiated).async {
        guard let imageData: Data = try? Data(contentsOf: imageURL) else { return }
        let image: UIImage? = UIImage(data: imageData)
        
        DispatchQueue.main.async {
          self.catalogueImage.image = image
          
        }
      
    }
    
  }*/
  
  func loadImagesFromBundle(callback: @escaping ([UIImage]) -> Void)  {
    var imagesArray = [UIImage]()
    DispatchQueue.global(qos: .userInitiated).async {
      imagesArray = (0...160).compactMap({ UIImage(named: "test_images/\($0)_") ?? UIImage()})
      
      callback(imagesArray)
      
    }
  }
  
}

