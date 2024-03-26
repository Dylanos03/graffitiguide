//
//  HomeView.swift
//  GraffitiGuide
//
//  Created by Dylan O'Sullivan on 26/03/2024.
//

import SwiftUI

struct AboutUsView: View {
    var body: some View {
        
        
            ZStack{
                Image("StartPage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("About Us")
                        .font(.largeTitle)
                        .padding(.top, 40.0)
                        .foregroundColor(.white)
                    
                    
                    Spacer()
                    NavigationLink(destination: HomeView()) {
                        
                        Text("Start")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                    }
                    .padding(.bottom, 30.0)

                }
                .padding()
            }
    }
    }


#Preview {
    AboutUsView()
}
