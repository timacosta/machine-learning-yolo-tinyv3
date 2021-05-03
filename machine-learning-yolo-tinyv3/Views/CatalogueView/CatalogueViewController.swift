//
//  ViewController.swift
//  machine-learning-yolo-tinyv3
//
//  Created by Tim Acosta on 16/4/21.
//

import UIKit

class CatalogueViewController: UIViewController {
  
  lazy var flowLayout: UICollectionViewFlowLayout = {
    let numberOfColumns = 2
    let sectionInset: CGFloat = 24
    let minimumInteritemSpacing: CGFloat = 34
    let minimumLineSpacing: CGFloat = 19
    let cellHeight: CGFloat = 200
    
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    let width: CGFloat = (UIScreen.main.bounds.width - sectionInset * 2 - minimumInteritemSpacing * (CGFloat(numberOfColumns) - 1)) / CGFloat(numberOfColumns)
    layout.itemSize = CGSize(width: width, height: cellHeight)
    layout.minimumInteritemSpacing = minimumInteritemSpacing
    layout.minimumLineSpacing = minimumLineSpacing
    layout.sectionInset = UIEdgeInsets(top: sectionInset, left: sectionInset, bottom: sectionInset, right: sectionInset)
    return layout
  }()
  
  lazy private var collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .white
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(CatalogueCell.self, forCellWithReuseIdentifier: CatalogueCell.catalogueCellIdentifier)
    return collectionView
  }()
  

  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
    
  }
  
  func setupCollectionView() {
    view = UIView()
    view.backgroundColor = .white
    
    view.addSubview(collectionView)
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: view.topAnchor),
      collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
      collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
    
    
  }
  
}

//MARK: - DataSource extension
extension CatalogueViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 600
  }
  
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogueCell.catalogueCellIdentifier, for: indexPath) as? CatalogueCell else {return UICollectionViewCell()}
    
    cell.loadImagesFromBundle { images in
      DispatchQueue.main.async {
        cell.catalogueImage.image = images[indexPath.row]
      }
      
    }
    
    return cell
    
    /*var imagesArray = [UIImage]()
    (0...150).forEach { imagesArray.append(UIImage(named: "test_images/\($0)_") ?? UIImage())}
    
    cell.catalogueImage.image = imagesArray[indexPath.row]
                                          
    return cell*/
    
  }
  
}

//MARK: - Delegate extension
extension CatalogueViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //TODO
  }
}


