//
//  ListViewController.swift
//  Tab-n-Nav
//
//  Created by Eugène Kiriloff on 22/01/2025.
//

import UIKit

class ListViewController: UITableViewController {
  private let customTitle: String
  private let items: [String]
  private let backgroundColor: UIColor
  
  init(title: String, items: [String], backgroundColor: UIColor) {
    self.customTitle = title
    self.items = items
    self.backgroundColor = backgroundColor
    super.init(style: .plain)
    self.view.backgroundColor = .clear
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = customTitle
  }
  
  override func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    items.count
  }
  
  override func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(
      withIdentifier: "cell"
    ) ?? UITableViewCell(
      style: .default,
      reuseIdentifier: "cell"
    )
    cell.textLabel?.text = items[indexPath.row]
    cell.accessoryType = .disclosureIndicator
    cell.backgroundColor = .clear
    return cell
  }
  
  override func tableView(
    _ tableView: UITableView,
    didSelectRowAt indexPath: IndexPath
  ) {
    tableView.deselectRow(at: indexPath, animated: true)
    let detailVC = DetailViewController(
      item: items[indexPath.row],
      backgroundColor: backgroundColor
    )
    navigationController?.pushViewController(detailVC, animated: true)
  }
}
