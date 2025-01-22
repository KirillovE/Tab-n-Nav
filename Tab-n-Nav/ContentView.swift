import SwiftUI

struct ContentView: View {
  @State private var selectedTab = 0
  
  var body: some View {
    Group {
      ZStack {
        if selectedTab == 0 {
          ListViewControllerRepresentable(listType: .list1)
            .transition(.move(edge: .leading))
        } else {
          ListViewControllerRepresentable(listType: .list2)
            .transition(.move(edge: .trailing))
        }
      }
      .animation(.snappy, value: selectedTab)
      
      Spacer(minLength: .zero)
      
      Picker("Tabs", selection: $selectedTab) {
        Text("List 1").tag(0)
        Text("List 2").tag(1)
      }
      .pickerStyle(SegmentedPickerStyle())
      .padding()
    }
    .animation(.easeInOut) { group in
      group.background(
        selectedTab == 0 ? Color.pink.opacity(0.6) : .purple.opacity(0.6)
      )
    }
  }
}

#Preview {
  ContentView()
}
