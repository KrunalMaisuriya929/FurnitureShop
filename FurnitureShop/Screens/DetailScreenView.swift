//
//  DetailScreenView.swift
//  FurnitureShop
//
//  Created by Krunal on 22/03/25.
//

import SwiftUI

struct DetailScreenView: View {
   
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ZStack{
            Color("Bg")
            
            ScrollView{
                
                Image("chair_1")
                    .resizable()
                    .aspectRatio(1,contentMode: .fit)
                    .edgesIgnoringSafeArea(.top)
                
                descriptionView()
            }
            .edgesIgnoringSafeArea(.top)
                
            HStack{
                Text("$1299")
                    .font(.title)
                    .foregroundStyle(.white)
                Spacer()
                
                Text("Add to Cart")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Primary"))
                    .padding()
                    .padding(.horizontal, 8)
                    .background(.white)
                    .clipShape(.rect(cornerRadius: 10))
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .clipShape(RoundedCorner(radius: 100, corner: [.topLeft]))
            .frame(maxHeight: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
            
        }
        .toolbar(.automatic, for: .navigationBar)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
      
            
    }
}

#Preview {
    DetailScreenView()
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corner: corners) )
    }
}

struct BackButton : View {
    let action: () -> Void
    
    var body: some View{
        Button(action: action, label: {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
                .padding(.all, 12)
                .background(Color.white)
                .clipShape(.rect(cornerRadius: 8.0))
        })
    }
}

struct descriptionView : View {
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Luxury Swedia \nChair")
                .font(.title)
                .fontWeight(.bold)
            
            HStack(spacing: 4){
                ForEach(0 ..< 5) { item in
                    Image("Star")
                }
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text("Luxury Swedian Chair is a contemporary chair based on the virtues of modern craft. it carries on the simplicity and honestly of the archetypical chair.")
                .lineSpacing(8.0)
                .opacity(0.6)
            
            HStack(alignment: .top){
                VStack(alignment: .leading) {
                    Text("size")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Text("Height: 120 cm")
                        .opacity(0.6)
                    Text("Wide: 80 cm")
                        .opacity(0.6)
                    Text("Diameter: 72 cm")
                        .opacity(0.6)
                }
                .frame(maxWidth:.infinity, alignment: .leading)
                
                Spacer()
                
                VStack(alignment: .leading){
                    Text("Treatment")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Text("Jati Wood, Canvas \nAmazing Love")
                        .opacity(0.6)
                }
                .frame(maxWidth:.infinity, alignment: .leading)
            }
            .padding(.vertical)
            
            HStack{
                VStack{
                    Text("Color")
                        .fontWeight(.semibold)
                    HStack{
                        ColorDotView(color: Color.white)
                        ColorDotView(color: Color.black)
                        ColorDotView(color: Color(#colorLiteral(red: 0.1803921569, green: 0.6352941176, blue: 0.6705882353, alpha: 1)))
                        
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
               
                HStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "minus")
                            .padding(.all, 8)
                    })
                    .frame(width: 30, height: 30)
                    .overlay(RoundedCorner(radius: 50).stroke())
                    .foregroundColor(.black)
                    
                    Text("1")
                        .font(.title2)
                        .fontWeight(.medium)
                        .padding(.horizontal, 8)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(.all, 8)
                            .background(Color("Primary"))
                            .clipShape(Circle())
                    })
                }
            }
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .clipShape(RoundedCorner(radius: 30, corner: [.topLeft, .topRight]))
        .offset(x:0 , y: -30.0)
    }
}

struct ColorDotView: View {
    let color : Color
    
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct RoundedCorner : Shape {
    var radius : CGFloat = .infinity
    var corner : UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
    
}

