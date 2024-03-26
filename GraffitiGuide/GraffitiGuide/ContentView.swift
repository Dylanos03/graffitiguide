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
                Image("StartPage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Text("Graffiti Guide")
                        .font(.largeTitle)
                        .padding(.top, 40.0)
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
