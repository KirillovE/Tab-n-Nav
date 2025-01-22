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
  private static var navigationControllers = [ListType: UINavigationController]()
  
  func makeUIViewController(context: Context) -> UINavigationController {
    if let existingNavController = Self.navigationControllers[listType] {
      return existingNavController
    }
    
    let listVC: UIViewController
    switch listType {
    case .list1:
      listVC = ListViewController(
        title: "List 1",
        items: ["Item 1A", "Item 1B", "Item 1C"]
      )
    case .list2:
      listVC = ListViewController(
        title: "List 2",
        items: ["Item 2A", "Item 2B", "Item 2C"]
      )
    }
    let navigationController = UINavigationController(
      rootViewController: listVC
    )
    Self.navigationControllers[listType] = navigationController
    return navigationController
  }
  
  func updateUIViewController(
    _ uiViewController: UINavigationController,
    context: Context
  ) { }
}
