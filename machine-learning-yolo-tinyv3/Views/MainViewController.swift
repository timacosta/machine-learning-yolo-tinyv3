//
//  MainViewController.swift
//  machine-learning-yolo-tinyv3
//
//  Created by Tim Acosta on 19/4/21.
//

import UIKit

class MainViewController: UIViewController {
  
  lazy private var buttonCatalogue: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Catalogue", for: .normal)
    button.setTitleColor(UIColor.black, for: .normal)
    button.addTarget(self, action: #selector(showCatalogue), for: .touchUpInside)
    return button
  }()
  
  lazy private var buttonSearchCatalogue: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Search picture", for: .normal)
    button.setTitleColor(UIColor.black, for: .normal)
    button.addTarget(self, action: #selector(searchPicture), for: .touchUpInside)
    return button
  }()
  
  @objc
  func showCatalogue() {
    let catalogueViewController = CatalogueViewController()
    navigationController?.pushViewController(catalogueViewController, animated: true)
  }
  
  @objc
  func searchPicture() {
    let searchViewController = SearchViewController()
  }
  
  override func loadView() {
    setupView()
    
  }
  

  
  func setupView() {
    view = UIView()
    view.backgroundColor = .white
    
    view.addSubview(buttonCatalogue)
    NSLayoutConstraint.activate([
      buttonCatalogue.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttonCatalogue.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      //buttonCatalogue.topAnchor.constraint(equalTo: view.topAnchor)
    ])
  }
  
  
  
}



