//
//  Memory_Management_SimulatorApp.swift
//  Memory Management Simulator
//
//  Created by Dylan Duhamel on 11/27/22.
//

import SwiftUI

@main
struct Memory_Management_SimulatorApp: App {
    var body: some Scene {
        WindowGroup {
            //PreferencesView()
            //FilePickerView()
            SimulationView(data: Parameters.sampleData)
        }
    }
}
