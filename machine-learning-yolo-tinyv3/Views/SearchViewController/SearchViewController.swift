//
//  SearchViewController.swift
//  machine-learning-yolo-tinyv3
//
//  Created by Tim Acosta on 20/4/21.
//

import UIKit


class SearchViewController: UIViewController {
  
  lazy var searchController: UISearchController = {
    let searchController = UISearchController()
    return searchController
  }()
  
  lazy var flowLayout: UICollectionViewFlowLayout = {
    let numberOfColumns = 2
    let cellHeight: CGFloat = 200
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    return layout
  }()
  
  lazy private var collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .white
    collectionView.dataSource = self
    //collectionView.delegate = self
    collectionView.register(CatalogueCell.self, forCellWithReuseIdentifier: CatalogueCell.catalogueCellIdentifier)
    return collectionView
  }()
  
  
  override func loadView() {
    super.loadView()
    setUpView()
    
  }
  
  
  
  func setUpView() {
    view = UIView()
    view.backgroundColor = .white
    navigationItem.searchController = searchController
    searchController.hidesNavigationBarDuringPresentation = false
    searchController.searchBar.becomeFirstResponder()
    
    view.addSubview(collectionView)
    
    NSLayoutConstraint.activate([
      collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      collectionView.topAnchor.constraint(equalTo: view.topAnchor),
      collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
      collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
    ])
    
  }
}

extension SearchViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 600
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogueCell.catalogueCellIdentifier, for: indexPath) as? CatalogueCell else {return UICollectionViewCell()}
    
    
    var imagesArray = [UIImage]()
    (0...152).forEach { imagesArray.append(UIImage(named: "test_images/\($0)_") ?? UIImage())}
    
    cell.catalogueImage.image = imagesArray[indexPath.row]
                                          
    return cell
  }
  
  
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 200, height: 200)
  }
}
