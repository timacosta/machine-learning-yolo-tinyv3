//
//  ViewController.swift
//  machine-learning-yolo-tinyv3
//
//  Created by Tim Acosta on 16/4/21.
//

import UIKit

class CatalogueViewController: UICollectionViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
    
  }
  //..
  func setupCollectionView() {
    collectionView.backgroundColor = .white
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.register(CatalogueCell.self, forCellWithReuseIdentifier: CatalogueCell.catalogueCellIdentifier)
  }
  
}

//MARK: - DataSource extension
extension CatalogueViewController {
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 600
  }
  
  
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogueCell.catalogueCellIdentifier, for: indexPath) as? CatalogueCell else {return UICollectionViewCell()}
    
    
    var imagesArray = [UIImage]()
    (0...150).forEach { imagesArray.append(UIImage(named: "test_images/\($0)_") ?? UIImage())}
    
    cell.catalogueImage.image = imagesArray[indexPath.row]
                                          
    return cell
    
  }
  
}

extension CatalogueViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 200, height: 200)
  }
  
}

