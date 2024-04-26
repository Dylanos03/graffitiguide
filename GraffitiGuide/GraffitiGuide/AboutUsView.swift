//
//  HomeView.swift
//  GraffitiGuide
//
//  Created by Dylan O'Sullivan on 26/03/2024.
//

import SwiftUI

var aboutText: String {
    "This app has been made to educate people on the street art that covers Bristol, from the random tags to Banksy to commissioned murals. \n \n The line between Art and Vandalism can be subjective, some saying that all of it is art in its own way, but the law stating that it is a form of vandalism (unless created with permission)."
} // Text to be displayed on the About Us page

struct AboutUsView: View {
    var body: some View {
        
        
            ZStack{
                Image("StartPage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("About Us")
                        .font(.custom( "aAnotherTag", size: 72))
                        .padding(.top, 40.0)
                        .foregroundColor(.white)
                    
                    Text(aboutText) // Displaying the aboutText string
                        .font(.body)
                        .foregroundColor(Color.white)
                        .padding(.top, 5)
                    Spacer()
                    NavigationLink(destination: HomeView()) {
                        
                        Text("Start")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                    }
                    .padding(.bottom, 50)

                }
                .padding()
            }.navigationBarTitleDisplayMode(.inline)
    }
    
}


#Preview {
    AboutUsView()
}
