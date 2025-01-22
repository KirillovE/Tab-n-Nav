//
//  ListViewController.swift
//  Tab-n-Nav
//
//  Created by Eugène Kiriloff on 22/01/2025.
//

import UIKit

class ListViewController: UITableViewController {
  private let items: [String]
  
  init(items: [String]) {
    self.items = items
    super.init(style: .plain)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "List"
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
    return cell
  }
  
  override func tableView(
    _ tableView: UITableView,
    didSelectRowAt indexPath: IndexPath
  ) {
    tableView .deselectRow(at: indexPath, animated: true)
    let detailVC = DetailViewController(item: items[indexPath.row])
    navigationController?.pushViewController(detailVC, animated: true)
  }
}
