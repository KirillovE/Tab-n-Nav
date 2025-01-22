import SwiftUI

struct ContentView: View {
  @State private var selectedTab = 0
  
  var body: some View {
    VStack {
      if selectedTab == 0 {
        ListViewControllerRepresentable(listType: .list1)
      } else {
        ListViewControllerRepresentable(listType: .list2)
      }

      Picker("Tabs", selection: $selectedTab) {
        Text("List 1").tag(0)
        Text("List 2").tag(1)
      }
      .pickerStyle(SegmentedPickerStyle())
      .padding()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
