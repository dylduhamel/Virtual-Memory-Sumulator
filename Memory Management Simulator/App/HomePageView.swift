//
//  HomePageView.swift
//  Memory Management Simulator
//
//  Created by Dylan Duhamel on 11/27/22.
//

import SwiftUI

struct HomePageView: View {
    // MARK: - Property
    
    
    // MARK: - Function
    var body: some View {
        HStack {
            // MARK: - Main HStack
            Spacer()

            VStack {
                // MARK: - Home screen image VStack
                Text("Image will go below here")
                Circle()
                    .stroke(.blue)
                    .frame(width: 200)
            }
            
            Spacer()
            
            VStack {
                Text("Virtual Memory Simulation")
                    .font(.title)
                    .fontWeight(.light)
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                    .padding()
                
                
            }
            
            Spacer()
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
