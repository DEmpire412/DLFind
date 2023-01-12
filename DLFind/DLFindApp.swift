//
//  DLFindApp.swift
//  DLFind
//
//  Created by David Empire on 11/17/22.
//


import SwiftUI

@main
struct DLFindApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        #if os(macOS)
        Settings {
            macOSSettings()
                .frame(minWidth: 300, maxWidth: 300, minHeight: 100, maxHeight: 300)
        }
        #endif
    }
}
