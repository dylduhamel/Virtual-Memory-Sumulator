//
//  MainMemoryView.swift
//  Memory Management Simulator
//
//  Created by Dylan Duhamel on 1/22/23.
//

import SwiftUI

struct MainMemoryView: View {
    
    // MARK: - Properties
    
    var index: Int
    var address: Int
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            Text("\(index)")
                .font(.body)
                .foregroundColor(Color.secondary)
                .padding(.horizontal)
                .frame(maxWidth: 60)
            
            HStack {
                Text("\(address)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.leading, 20)
                Spacer()
            } //: HStack
            .frame(maxWidth: 300)
            .background(Rectangle().stroke(Color.black, lineWidth: 2))
            .background(Color.white)
        } //: HStack
    }
}

// MARK: - Preview

struct MainMemoryView_Previews: PreviewProvider {
    static var previews: some View {
        MainMemoryView(index: 0, address: 50)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
