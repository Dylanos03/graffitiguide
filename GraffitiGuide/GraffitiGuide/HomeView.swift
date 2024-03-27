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
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.4545, longitude: -2.5879),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )

    let locations = [
        IdentifiableLocation(coordinate: CLLocationCoordinate2D(latitude: 51.45333877042843, longitude: -2.6012225659966983)),
        IdentifiableLocation(coordinate: CLLocationCoordinate2D(latitude: 51.45561574643262, longitude: -2.5956210324280113)),
        IdentifiableLocation(coordinate: CLLocationCoordinate2D(latitude: 51.45582688497305, longitude: -2.5954265918505564)),
        IdentifiableLocation(coordinate: CLLocationCoordinate2D(latitude: 51.46215235201216, longitude: -2.590137192611473)),
        IdentifiableLocation(coordinate: CLLocationCoordinate2D(latitude: 51.47541537137639, longitude: -2.560962590031951)),
        
    ]

        var body: some View {
            
                ZStack {
                    Map(coordinateRegion: $region, annotationItems: locations) { location in
                        MapPin(coordinate: location.coordinate)
                    }
                    .edgesIgnoringSafeArea(.all)
                    VStack {
                        Rectangle()
                            .edgesIgnoringSafeArea(.vertical)
                            .frame(height: 30)
                            .foregroundColor(.black)
                        Spacer()
                        Rectangle()
                            .edgesIgnoringSafeArea(.vertical)
                            .frame(height: 100)
                            .foregroundColor(.black)
                    }
                    VStack {

                        Spacer()
                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                        NavigationLink(destination: CameraView()) {
                            
                            Text("Scan Code")
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
