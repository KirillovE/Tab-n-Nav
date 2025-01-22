//
//  ListViewControllerRepresentable.swift
//  Tab-n-Nav
//
//  Created by Eugène Kiriloff on 22/01/2025.
//

import SwiftUI
import UIKit

struct ListViewControllerRepresentable: UIViewControllerRepresentable {
  enum ListType {
    case list1
    case list2
  }
  
  let listType: ListType
  
  func makeUIViewController( context: Context ) -> UINavigationController {
    let listVC: UIViewController
    switch listType {
    case .list1:
      listVC = ListViewController(
        items: ["Item 1A", "Item 1B", "Item 1C"]
      )
    case .list2:
      listVC = ListViewController(
        items: ["Item 2A", "Item 2B", "Item 2C"]
      )
    }
    let navigationController = UINavigationController(
      rootViewController: listVC
    )
    return navigationController
  }
  
  func updateUIViewController(
    _ uiViewController: UINavigationController,
    context: Context
  ) { }
}
