//
//  DetailViewController.swift
//  Tab-n-Nav
//
//  Created by Eugène Kiriloff on 22/01/2025.
//


import UIKit

class DetailViewController: UIViewController {
  private let item: String
  
  init(item: String) {
    self.item = item
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    title = "Detail"
    
    let label = UILabel()
    label.text = item
    label.textAlignment = .center
    label.font = .systemFont(ofSize: 24)
    label.translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(label)
    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
}
