import SwiftUI

struct ContentView: View {
  @State private var selectedTab = 0
  @State private var previousTab = 0

  private let jediColor = Color(red: 153/255, green: 202/255, blue: 255/255)
  private let programmerColor = Color(red: 103/255, green: 222/255, blue: 200/255)
  private let sithColor = Color(red: 255/255, green: 137/255, blue: 131/255)
  
  var body: some View {
    NavigationView {
      VStack {
        ZStack {
          // Background color animation
          currentBackgroundColor
            .ignoresSafeArea()
            .animation(.snappy, value: selectedTab) // Animate background color
          
          // Content animation
          Group {
            if selectedTab == 0 {
              ListViewControllerRepresentable(
                listType: .jedi,
                backgroundColor: jediColor
              )
              .transition(
                transitionDirection(from: previousTab, to: selectedTab)
              )
            } else if selectedTab == 1 {
              ListViewControllerRepresentable(
                listType: .programmers,
                backgroundColor: programmerColor
              )
              .transition(
                transitionDirection(from: previousTab, to: selectedTab)
              )
            } else {
              ListViewControllerRepresentable(
                listType: .sith,
                backgroundColor: sithColor
              )
              .transition(
                transitionDirection(from: previousTab, to: selectedTab)
              )
            }
          }
          .animation(.snappy, value: selectedTab) // Animates the content transition
        }
        
        Spacer(minLength: .zero)
        
        Picker("Tabs", selection: $selectedTab) {
          Text("Jedi").tag(0)
          Text("Programmers").tag(1)
          Text("Sith").tag(2)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
        .background(currentBackgroundColor)
        .animation(.snappy, value: selectedTab) // Animate background color
      }
      .navigationTitle("Star Wars")
      .onChange(of: selectedTab) { newTab in
        previousTab = newTab
      }
    }
  }
  
  private var currentBackgroundColor: Color {
    switch selectedTab {
    case 0: return jediColor
    case 1: return programmerColor
    default: return sithColor
    }
  }
  
  private func transitionDirection(
    from oldTab: Int,
    to newTab: Int
  ) -> AnyTransition {
    if newTab > oldTab {
      .move(edge: .trailing)
    } else {
      .move(edge: .leading)
    }
  }
}

#Preview {
  ContentView()
}
