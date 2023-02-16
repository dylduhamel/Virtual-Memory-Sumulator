//
//  parameters.swift
//  Memory Management Simulator
//
//  Created by Dylan Duhamel on 11/27/22.
//

import Foundation

class Parameters: ObservableObject {
    @Published var memorySize: Int // Max of 20
    @Published var placementPolicy: Int // Placement polict of OS
    @Published var replacementAlgorithm: Int // Page replacement policy 0-4
    @Published var memoryAccessTime: Int
    @Published var diskAccessTime: Int
    
    init(memorySize: Int, placementPolicy: Int, replacementAlgorithm: Int, memoryAccessTime: Int, diskAccessTime: Int) {
        self.memorySize = memorySize
        self.placementPolicy = placementPolicy
        self.replacementAlgorithm = replacementAlgorithm
        self.memoryAccessTime = memoryAccessTime
        self.diskAccessTime = diskAccessTime
    }
    static var sampleData: Parameters {
        Parameters(memorySize: 15, placementPolicy: 2, replacementAlgorithm: 2, memoryAccessTime: 15, diskAccessTime: 7)
    }
}

//
//extension Parameters {
//    static var sampleData: Parameters {
//        Parameters(memorySize: 15, placementPolicy: 2, replacementAlgorithm: 2, memoryAccessTime: 15, diskAccessTime: 7)
//    }
//}
