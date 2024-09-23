import SwiftUI


struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        TabBarView()
    }
}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

#Preview {
    ContentView()
}
