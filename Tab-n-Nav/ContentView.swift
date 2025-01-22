import SwiftUI

struct ContentView: View {
  @State private var selectedTab = 0
  private let jediColor = Color(red: 153/255, green: 202/255, blue: 255/255)
  private let sithColor = Color(red: 255/255, green: 137/255, blue: 131/255)

  var body: some View {
    withAnimation {
      Group {
        ZStack {
          if selectedTab == 0 {
            ListViewControllerRepresentable(
              listType: .list1,
              backgroundColor: jediColor
            )
            .transition(.move(edge: .leading))
          } else {
            ListViewControllerRepresentable(
              listType: .list2,
              backgroundColor: sithColor
            )
            .transition(.move(edge: .trailing))
          }
        }
        .animation(.snappy, value: selectedTab)
        
        Spacer(minLength: .zero)
        
        Picker("Tabs", selection: $selectedTab) {
          Text("Jedi").tag(0)
          Text("Sith").tag(1)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
      }
      .background(
        selectedTab == 0 ? jediColor : sithColor
      )
    }
  }
}

#Preview {
  ContentView()
}
