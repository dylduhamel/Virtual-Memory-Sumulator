//
//  PageTableView.swift
//  Memory Management Simulator
//
//  Created by Dylan Duhamel on 1/22/23.
//

import SwiftUI

struct PageTableView: View {
    
    // MARK: - Properties
    
    var index: Int
    var page: String
    var x: Int = 1
    var status: String = "DK" // Page is in disk
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            Text("\(index)")
                .font(.body)
                .foregroundColor(Color.secondary)
                .frame(maxWidth: 60)
            
            HStack {
                Text(page)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal, 10)
                
                Spacer()
                
                Text("\(x)")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                
                Text("\(status)")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                
            } //: HStack
            .frame(maxWidth: 200)
            .background(Rectangle().stroke(Color.black, lineWidth: 2))
            .background(Color.white)
        } //: HStsck
    }
}

// MARK: - Preview

struct PageTableView_Previews: PreviewProvider {
    static var previews: some View {
        PageTableView(index: 0, page: "C")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
