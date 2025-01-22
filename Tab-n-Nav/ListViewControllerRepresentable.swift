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
    
    // here we should `resolve` our controllers
    // with theirs respective `UINavigationContollers`
    // and voilà
    let listVC: UIViewController
    switch listType {
    case .list1:
      listVC = ListViewController(
        title: "Jedi",
        items: ["Anakin Skywalker", "Obi-Wan Kenobi", "Yoda", "Qui-Gon Jinn"]
      )
    case .list2:
      listVC = ListViewController(
        title: "Sith",
        items: ["Vader", "Sidious", "Maul", "Tyranus"]
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
