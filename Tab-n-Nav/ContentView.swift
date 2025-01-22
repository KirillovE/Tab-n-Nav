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
        Text("Jedi").tag(0)
        Text("Sith").tag(1)
      }
      .pickerStyle(SegmentedPickerStyle())
      .padding()
    }
    .animation(.easeInOut) { group in
      group.background(
        selectedTab == 0 ? Color.blue.opacity(0.5) : .red.opacity(0.5)
      )
    }
  }
}

#Preview {
  ContentView()
}
