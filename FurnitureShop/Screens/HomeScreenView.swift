//
//  HomeScreenView.swift
//  FurnitureShop
//
//  Created by Krunal on 22/03/25.
//

import SwiftUI

struct HomeScreenView: View {
   
    @State private var search: String = ""
    @State private var selectedIndex : Int = 1
    
    private let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false){
                    VStack(alignment: .leading){
                        
                        AppBarView()
                     
                        TagLineView()
                            .padding()
                        
                        SearchAndScanView(search: $search)
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            
                            HStack{
                                ForEach(0 ..< categories.count){ i in
                                    Button(action: {selectedIndex = i}) {
                                        CategoryView(text: categories[i], isActive: selectedIndex == i)
                                    }
                                }
                                
                            }
                            .padding()
                        }
                        
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 0){
                                ForEach(0 ..< 4){ i in
                                    NavigationLink(
                                        destination: DetailScreenView(),
                                        label: {
                                            ProductCardView(image: Image("chair_\(i+1)"), size: 210)
                                        })
                                    .toolbar(.hidden, for:.navigationBar)
                                    .foregroundColor(.black)
                                }
                                .padding(.leading)
                            }
                        }
                        .padding(.bottom)
                        
                        Text("Best")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        
                    }
                    
                }//scrollView
                
                
            }
            
        }//Navigation stack
    }
}

#Preview {
    HomeScreenView()
}


struct AppBarView: View {
    
    var body: some View {
        HStack{
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image("menu")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(uiImage: #imageLiteral(resourceName: "Profile"))
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    
    var body: some View {
            Text("Find the \nBest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundStyle(Color("Primary"))
        + Text("Furniture")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .fontWeight(.bold)
            .foregroundStyle(Color("Primary"))
    }
}

struct SearchAndScanView : View {
    
    @Binding var search: String
    
    var body: some View {
        HStack{
            HStack{
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Furniture", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .clipShape(.rect(cornerRadius: 10))
            .padding(.trailing, 8)
            
            Button(action: {}) {
                Image("Scan")
                    .padding()
                    .background(Color("Primary"))
                    .clipShape(.rect(cornerRadius: 10))
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let text : String
    let isActive : Bool
    
    
    var body: some View {
        VStack{
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundStyle(isActive ? Color("Primary") : Color.black.opacity(0.5))
            
            if (isActive){
                Color("Primary")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    var image: Image
    var size: CGFloat
    
    var body: some View {
        VStack{
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .clipShape(.rect(cornerRadius: 20))
                
            Text("Luxury Swedian Chair")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack(spacing: 2){
                ForEach(0 ..< 5){ item in
                    Image("Star")
                }
                Spacer()
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 20))
    }
    
}
