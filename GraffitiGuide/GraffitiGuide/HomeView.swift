//
//  AboutView.swift
//  GraffitiGuide
//
//  Created by Dylan O'Sullivan on 26/03/2024.
//


import SwiftUI
import MapKit

struct IdentifiableLocation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct HomeView: View {
    @State private var region = MKCoordinateRegion( // State variable to hold the region of the map
            center: CLLocationCoordinate2D(latitude: 51.4545, longitude: -2.5879),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )

    let locations = [ // An array full of locations of graffiti
        IdentifiableLocation(coordinate: CLLocationCoordinate2D(latitude: 51.45333877042843, longitude: -2.6012225659966983)),
        IdentifiableLocation(coordinate: CLLocationCoordinate2D(latitude: 51.45561574643262, longitude: -2.5956210324280113)),
        IdentifiableLocation(coordinate: CLLocationCoordinate2D(latitude: 51.45582688497305, longitude: -2.5954265918505564)),
        IdentifiableLocation(coordinate: CLLocationCoordinate2D(latitude: 51.46215235201216, longitude: -2.590137192611473)),
        IdentifiableLocation(coordinate: CLLocationCoordinate2D(latitude: 51.47541537137639, longitude: -2.560962590031951)),
        
    ]

        var body: some View {
            
                ZStack { // ZStack to allow for the map to be displayed behind the buttons
                    Map(coordinateRegion: $region, annotationItems: locations) { location in 
                        MapPin(coordinate: location.coordinate) // MapPin to show the location of the graffiti
                    }
                    .edgesIgnoringSafeArea(.all) // To allow the map to be displayed behind the buttons
                    VStack {  // VStack to hold the Black bars at the top and bottom of the screen
                        Rectangle() // Rectangle to create a black bar at the top of the screen
                            .edgesIgnoringSafeArea(.vertical)
                            .frame(height: 30)
                            .foregroundColor(.black)
                        Spacer() // Spacer to push the buttons to the bottom of the screen
                        Rectangle() // Rectangle to create a black bar at the bottom of the screen
                            .edgesIgnoringSafeArea(.vertical)
                            .frame(height: 100)
                            .foregroundColor(.black)
                    }
                    VStack { // VStack to hold the buttons

                        Spacer() // Spacer to push the buttons to the bottom of the screen
                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/) 
                        NavigationLink(destination: CameraView()) { // NavigationLink to allow the user to navigate to the CameraView
                            
                            Text("Scan Code") // Text to display the text "Scan Code" on the button
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
