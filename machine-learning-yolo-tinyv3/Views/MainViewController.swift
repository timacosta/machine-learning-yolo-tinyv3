//
//  MainViewController.swift
//  machine-learning-yolo-tinyv3
//
//  Created by Tim Acosta on 19/4/21.
//

import UIKit

class MainViewController: UIViewController {
  
  lazy private var btnCatalogue: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.contentVerticalAlignment = .top
    button.setTitleColor(UIColor.black, for: .normal)
    button.setImage(UIImage(systemName: "book"), for: .normal)
    button.setTitle("Catalogue", for: .normal)
    button.addTarget(self, action: #selector(showCatalogue), for: .touchUpInside)
    button.alignVertical()
    return button
  }()
  
  lazy private var btnSearchCatalogue: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitleColor(UIColor.black, for: .normal)
    button.setTitle("Search picture", for: .normal)
    button.setImage(UIImage(systemName: "doc.text.magnifyingglass"), for: .normal)
    button.addTarget(self, action: #selector(searchPicture), for: .touchUpInside)
    button.alignVertical()
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
    navigationController?.pushViewController(searchViewController, animated: true)
  }
  
  override func loadView() {
    setupView()
    
  }
  

  
  func setupView() {
    view = UIView()
    view.backgroundColor = .white
    
    view.addSubview(btnCatalogue)
    NSLayoutConstraint.activate([
      btnCatalogue.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 100.0),
      btnCatalogue.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
    
    view.addSubview(btnSearchCatalogue)
    NSLayoutConstraint.activate([
      btnSearchCatalogue.centerXAnchor.constraint(greaterThanOrEqualTo: btnCatalogue.centerXAnchor, constant: 200.0),
      btnSearchCatalogue.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
    
  }
  
}

extension UIButton {
  func alignVertical(spacing: CGFloat = 6.0) {
    guard let imageSize = self.imageView?.image?.size,
          let text = self.titleLabel?.text,
          let font = self.titleLabel?.font
    else {return}
    
    self.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -imageSize.width, bottom: -(imageSize.height + spacing), right: 0.0)
    let labelString = NSString(string: text)
    let titleSize = labelString.size(withAttributes: [kCTFontAttributeName as NSAttributedString.Key : font])
    self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height), left: 0.0, bottom: 0.0, right: -titleSize.width)
    let edgeOffset = abs(titleSize.height - imageSize.height) / 2.0
    self.contentEdgeInsets = UIEdgeInsets(top: edgeOffset, left: 0.0, bottom: edgeOffset, right: 0.0)
    
  }
}



