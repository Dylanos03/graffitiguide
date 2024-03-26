//
//  AboutView.swift
//  GraffitiGuide
//
//  Created by Dylan O'Sullivan on 26/03/2024.
//


import SwiftUI
import MapKit

struct HomeView: View {
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.4545, longitude: -2.5879),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )

        var body: some View {
            
                ZStack {
                    Map(coordinateRegion: $region)
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Rectangle()
                            .edgesIgnoringSafeArea(.vertical)
                            .frame(height: 30)
                            .background(.black)
                        Spacer()
                        Rectangle()
                            .edgesIgnoringSafeArea(.vertical)
                            .frame(height: 100)
                            .background(.black)
                    }
                    VStack {

                        Spacer()
                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                        NavigationLink(destination: CameraView()) {
                            
                            Text("Start")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            
                        }

                    }
                    .padding()
                }
            }
        
}

#Preview {
    HomeView()
}
