import SwiftUI


struct ContentView: View {
    @State private var selectedCategory = "All"
    let categories = ["All", "6-8 M", "8-10 M", "10-12 M"]
    
    
    
    var body: some View {
        var columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        var items :[[Any]] = mainItem
        ZStack{
            Color(red: 173/255, green: 216/255, blue: 230/255) // Baby blue color
                           .edgesIgnoringSafeArea(.all) // Ensures the background covers the entire screen
            VStack(spacing: 0) {
                // Header
                HStack {
                    Text("Ingredients")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "person.circle")
                        .font(.largeTitle)
                    
                }
                .padding()
                
                // Search Bar
                HStack {
                    TextField("Search", text: .constant(""))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color(.systemGray5))
                        .cornerRadius(10)
                    Image(systemName: "mic")
                        .padding(.leading, 10)
                }
                .padding(.horizontal)
                
                // Category Filter
                Picker("Category", selection: $selectedCategory) {
                                   ForEach(categories, id: \.self) { category in
                                       Text(category).tag(category)
                                   }
                               }
                               .pickerStyle(SegmentedPickerStyle())
                               .padding()
                
                // Ingredients Grid
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 30) {
                        ForEach(0..<items.count,id: \.self){
                            item in MainItem(imageName: items[item][0] as! String, Title: items[item][1] as! String, desc: items[item][2]as!String, color: items[item][3] as!Color, selfIndex: item)
                        }
                        }
                    }
                
                    .padding(9)
               
                        //  TabBarView()
                       
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: "hand.thumbsup")
                        Text("FOR YOU")
                    }
                    Spacer()
                    VStack {
                        Image(systemName: "chart.bar")
                        Text("TRACKER")
                    }
                    Spacer()
                    VStack {
                        Image(systemName: "carrot.fill")
                        Text("INGREDIENTS")
                            .fontWeight(.bold)
                            .foregroundColor(Color.blue)
                    }
                    Spacer()
                }
                .background(Color(red: 209/255, green: 233/255, blue: 246/255)) // D1E9F6 color
                               .frame(maxWidth: .infinity)
                               .padding(.horizontal)
                               .edgesIgnoringSafeArea(.bottom) // Ensures the tab bar covers the bottom area
                
                           }
           
            
        
            }
              
        }
    }


struct Ingredient: Identifiable {
    let id = UUID()
    let name: String
    let image: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
