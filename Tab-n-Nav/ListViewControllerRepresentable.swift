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
    case jedi
    case programmers
    case sith
  }
  
  let listType: ListType
  let backgroundColor: Color
  private static var viewControllers = [ListType: UIViewController]()
  
  func makeUIViewController(context: Context) -> UIViewController {
    if let existingNavController = Self.viewControllers[listType] {
      return existingNavController
    }
    
    let listVC: UIViewController
    switch listType {
    case .jedi:
      listVC = ListViewController(
        title: "Jedi",
        items: [
          "Obi-Wan Kenobi",
          "Anakin Skywalker",
          "Luke Skywalker",
          "Ahsoka Tano",
          "Yoda",
          "Mace Windu",
          "Qui-Gon Jinn",
          "Shaak Ti",
          "Ki-Adi-Mundi",
          "Plo Koon",
          "Aayla Secura",
          "Luminara Unduli",
          "Barriss Offee",
          "Cal Kestis",
          "Kanan Jarrus",
          "Ezra Bridger",
          "Depa Billaba",
          "Cere Junda",
          "Jocasta Nu",
          "Stass Allie",
          "Adi Gallia",
          "Eeth Koth",
          "Yaddle",
          "Saesee Tiin",
          "Tera Sinube",
          "Coleman Trebor",
          "Oppo Rancisis",
          "Quinlan Vos",
          "Rey Skywalker",
          "Bastila Shan"
        ],
        backgroundColor: .init(backgroundColor),
        isJediList: true
      )
    case .programmers:
      listVC = ListViewController(
        title: "Programmers",
        items: [
          "Linus Torvalds",
          "Bjarne Stroustrup",
          "Donald Knuth",
          "Steve Wozniak",
          "Marton Kerekes",
          "James Gosling",
          "Dennis Ritchie",
          "Alizée Camarasa",
          "Ken Thompson",
          "Grace Hopper",
          "Tim Berners-Lee",
          "Mark Zuckerberg",
          "Eugène Kiriloff"
        ],
        backgroundColor: .init(backgroundColor),
        isJediList: true
      )
    case .sith:
      listVC = ListViewController(
        title: "Sith",
        items: [
          "Sidious",
          "Vader",
          "Maul",
          "Tyranus",
          "Plagueis",
          "Bane",
          "Revan",
          "Malak",
          "Nihilus",
          "Sion",
          "Traya",
          "Zannah",
          "Malgus",
          "Marr",
          "Krayt",
          "Talon",
          "Vitiate",
          "Tenebrous",
          "Ruin",
          "Andeddu",
          "Baras",
          "Nox",
          "Wyyrlok",
          "Cognus",
          "Rivan",
          "Exar Kun",
          "Naga Sadow",
          "Tulak Hord",
          "Ajunta Pall",
          "Savage Opress"
        ],
        backgroundColor: .init(backgroundColor),
        isJediList: false
      )
    }
    Self.viewControllers[listType] = listVC
    return listVC
  }
  
  func updateUIViewController(
    _ uiViewController: UIViewController,
    context: Context
  ) { }
}
