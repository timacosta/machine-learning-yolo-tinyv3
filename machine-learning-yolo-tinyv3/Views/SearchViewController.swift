//
//  SearchViewController.swift
//  machine-learning-yolo-tinyv3
//
//  Created by Tim Acosta on 20/4/21.
//

import UIKit
import CoreML
import Vision

class SearchViewController: UIViewController {
  
  lazy var searchController: UISearchController = {
    let searchController = UISearchController()
    
    return searchController
  }()
  
  /*lazy var searchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.searchBarStyle = .prominent
    searchBar.placeholder = "Introduce search term"
    //searchBar.sizeToFit()
    searchBar.isTranslucent = false
    return searchBar
  }()*/
  
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
    
    
    /*view.addSubview(searchBar)
    
    NSLayoutConstraint.activate([
      searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      searchBar.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      searchBar.topAnchor.constraint(equalTo: view.topAnchor),
      searchBar.leftAnchor.constraint(equalTo: view.leftAnchor),
      searchBar.rightAnchor.constraint(equalTo: view.rightAnchor)
    ])*/
    
  }
  
 
  
  
  
}
