//
//  PreferencesView.swift
//  Memory Management Simulator
//
//  Created by Dylan Duhamel on 11/27/22.
//

import SwiftUI
import Combine

struct PreferencesView: View {
    
    // MARK: - Properties
    
    @Environment(\.presentationMode) var presentationMode
    
    // The initial source of parameter data
    @StateObject var data: Parameters = Parameters.sampleData
    
    @State var memorySize = ""
    @State var placementPolicy = -1
    @State var replacementAlgo = -1
    @State var memoryAccessTime = ""
    @State var diskAccessTime = ""
    
    // MARK: - Body
    var body: some View {
        NavigationView() {
            ZStack {
                Color("ColorBackground")
                    .ignoresSafeArea(.all)
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        
                        VStack(spacing: 30) {
                            memorySizeView
                                .padding()
                                .frame(width: 375, height: 150)
                                .background(Color("ColorBox"))
                                .cornerRadius(15)
                            placementPolicyView
                                .padding()
                                .frame(width: 375, height: 150)
                                .background(Color("ColorBox"))
                                .cornerRadius(15)
                            replacementAlgoView
                                .padding()
                                .frame(width: 375, height: 150)
                                .background(Color("ColorBox"))
                                .cornerRadius(15)
                            memoryAccessTimeView
                                .padding()
                                .frame(width: 375, height: 150)
                                .background(Color("ColorBox"))
                                .cornerRadius(15)
                            diskAccessTimeView
                                .padding()
                                .frame(width: 375, height: 150)
                                .background(Color("ColorBox"))
                                .cornerRadius(15)
                        } //: VStsvk
                        
                        Spacer()
                        
                    } //: HStack
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        // Submit button
                        Button(action: submit) {
                            Text("Submit")
                        }
                        .padding()
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                        
                        Spacer()
                        
                        FilePickerView()
                        
                        Spacer()
                    } //: VStack
                } //: VStack
                .padding()
                .textFieldStyle(.roundedBorder)
            } //: ZStack
            .navigationTitle("Parameters")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .padding(.all, 50)
                    }
                }
            }
        } //: Navigation view
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(data)
    }
}

// MARK: - Preview

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView(data: Parameters.sampleData)
    }
}

private extension PreferencesView {
    // Submit
    func submit() {
        // Make a new parameters member
//        data = Parameters(memorySize: Int(memorySize) ?? 0, placementPolicy: placementPolicy, replacementAlgorithm: replacementAlgo, memoryAccessTime: Int(memoryAccessTime) ?? 0, diskAccessTime: Int(diskAccessTime) ?? 0)
        
        data.placementPolicy = 12345
        
        print(data.placementPolicy)
    }
    
    // Memory Size
    var memorySizeView: some View {
        VStack {
            Text("Enter Memory Size").font(.title)
            TextField("Max of 20 frames", text: $memorySize)
                        .keyboardType(.numberPad)
                        .onReceive(Just(memorySize)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.memorySize = filtered
                            }
                        }
                        .frame(width: 200)
        } //: VStack
    }
    
    // Placement Policy
    var placementPolicyView: some View {
        VStack {
            Text("Choose Policy").font(.title)
            Menu {
                Button(action: {
                    placementPolicy = 0
                }, label: {
                    Text("Best Fit")
                })
                
                Button(action: {
                    placementPolicy = 1
                }, label: {
                    Text("First Fit")
                })
                
                Button(action: {
                    placementPolicy = 2
                }, label: {
                    Text("Worst Fit")
                })
            } label: {
                Label(
                    title: {Text("Options")},
                    icon: {Image(systemName: "plus")}
                )
            } //: Menu
        } //: VStack
    }
    
    // Replacement Algorithm
    var replacementAlgoView: some View {
        VStack {
            Text("Choose Replacement Algorithm")
                .font(.title)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
            Menu {
                Button(action: {
                    replacementAlgo = 0
                }, label: {
                    Text("Working Set")
                })
                
                Button(action: {
                    replacementAlgo = 1
                }, label: {
                    Text("LRU")
                })
                
                Button(action: {
                    replacementAlgo = 2
                }, label: {
                    Text("FIFO")
                })
                
                Button(action: {
                    replacementAlgo = 3
                }, label: {
                    Text("LFU")
                })
                
                Button(action: {
                    replacementAlgo = 4
                }, label: {
                    Text("MFU")
                })
            } label: {
                Label(
                    title: {Text("Options")},
                    icon: {Image(systemName: "plus")}
                )
            } //: Menu
        } //: VStack
    }
    
    // Memory Access Time
    var memoryAccessTimeView: some View {
        VStack {
            Text("Enter Memory Access Time")
                .font(.title)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
            TextField("Max 100 (seconds)", text: $memoryAccessTime)
                        .keyboardType(.numberPad)
                        .onReceive(Just(memoryAccessTime)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.memoryAccessTime = filtered
                            }
                        }
                        .frame(width: 200)
        } //: VStack
    }
    
    // Disk Access Time
    var diskAccessTimeView: some View {
        VStack {
            Text("Enter Disk Access Time")
                .font(.title)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
            TextField("Max 100 (seconds)", text: $diskAccessTime)
                        .keyboardType(.numberPad)
                        .onReceive(Just(diskAccessTime)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.diskAccessTime = filtered
                            }
                        }
                        .frame(width: 200)
        } //: VStack
    }
}
