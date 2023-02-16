//
//  SimulationView.swift
//  Memory Management Simulator
//
//  Created by Dylan Duhamel on 11/27/22.
//

import SwiftUI

struct SimulationView: View {
    
    // MARK: - Properties
    
    @State private var isShowingSettings: Bool = false
    
    @State private var logicalAddr = 0
    
    let data: Parameters
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ZStack {
                HStack {
                    VStack {
                        Spacer()
                        
                        VStack {
                            Text("Logical Add.")
                                .font(.title2)
                                .fontWeight(.heavy)
                            Text("\(logicalAddr)")
                                .font(.title)
                                .frame(maxWidth: 150, maxHeight: 50)
                                .background(Rectangle().stroke(Color.black, lineWidth: 2))
                                .background(Color.white)
                        } //: VStack
                        
                        Spacer()
                        
                        VStack {
                            Text("Clock")
                                .font(.title2)
                                .fontWeight(.heavy)
                            Text("\(data.memorySize)")
                                .font(.title)
                                .frame(maxWidth: 150, maxHeight: 50)
                                .background(Rectangle().stroke(Color.black, lineWidth: 2))
                                .background(Color.white)
                        } //: VStack
                        
                        Spacer()
                        
                        VStack {
                            Text("Speed Controller")
                                .font(.title2)
                                .fontWeight(.heavy)
                            Text("\(logicalAddr)")
                                .font(.title)
                                .frame(maxWidth: 150, maxHeight: 50)
                                .background(Rectangle().stroke(Color.black, lineWidth: 2))
                                .background(Color.white)
                        } //: VStack
                        Spacer()
                    } //: VStack
                    .padding(.horizontal, 75)
                    
                    Spacer()
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 40, height: 40)
                                //.padding(.trailing, 75)
                        } //: HStack
                        
                        Spacer()
                        
                        VStack {
                            Text("Page Table")
                                .padding(.vertical, 25)
                            ForEach (1..<5) {
                                PageTableView(index: $0, page: "B")
                                    .padding(.zero)
                            } //: VStsck
                        }
                        
                        Spacer()
                        
                        HStack {
                            VStack {
                                Text("Disk")
                                    .padding(.horizontal, 75)
                                
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(width: 100, height: 50)
                                    .clipShape(Ellipse())
                                    .background(Ellipse().stroke(Color.black, lineWidth: 4))
                            }
                            VStack {
                                Text("I/O Buffer")
                                    .padding(.horizontal, 75)
                                Text("\(data.memorySize)")
                                    .font(.title)
                                    .frame(maxWidth: 150, maxHeight: 50)
                                    .background(Rectangle().stroke(Color.black, lineWidth: 2))
                                    .background(Color.white)
                            }
                        } //: HStack
                        Spacer()
                    } //: VStack
                    
                    Spacer()
                    VStack {
                        ScrollView {
                            //Spacer()
                            Text("Main Memory")
                                .padding(.leading, 25)
                                .padding(.vertical, 10)
                            ForEach (1..<70) {
                                MainMemoryView(index: $0, address: 5)
                            } //: VStsck
                        } //: VStack
                        .padding(.horizontal, 150)
                    }
                } //: HStack
            } //: ZStack
            .navigationTitle("Virtual Memory Simulator")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowingSettings = true
                    }) {
                        HStack {
                            Text("Parameters")
                            Image(systemName: "slider.horizontal.3")
                        } //: Button
                        .sheet(isPresented: $isShowingSettings) {
                            PreferencesView()
                        }
                    }
                }
            }
        } //: Navigation view
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - Preview

struct SimulationView_Previews: PreviewProvider {
    static var previews: some View {
        SimulationView(data: Parameters.sampleData)
    }
}
