//
//  ContentView.swift
//  GraffitiGuide
//
//  Created by Dylan O'Sullivan on 26/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{ 
            ZStack{ 
                Image("StartPage") // Background image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack { // Placing text ontop of image background
                    
                    Text("Graffiti Guide")
                        .font(.custom( "aAnotherTag", size: 72))
                        .padding(.top, 70.0)
                        .foregroundColor(.white)
                    
                    
                    Spacer()
                    NavigationLink(destination: AboutUsView()) {
                        
                        Text("Start")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                    }
                    .padding(.bottom, 33.194)
                }
                .padding()
                
            }
        }
    }
}
#Preview {
    ContentView()
}
