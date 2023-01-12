//
//  macOSSettings.swift
//  DLFind
//
//  Created by David Empire on 1/12/23.
//

import SwiftUI

struct macOSSettings: View {
    @AppStorage("isDarkMode") private var isDarkMode = 0
    
    var body: some View {
        ScrollView {
            VStack {
                Form {
                    Picker("Appearance: ", selection: $isDarkMode) {
                        Text("System")
                            .tag(0)
                        Text("Light")
                            .tag(1)
                        Text("Dark")
                            .tag(2)
                    }
                    .pickerStyle(.inline)
                    .padding()
                }
            }
            .preferredColorScheme(isDarkMode == 1 ? .light : isDarkMode == 2 ? .dark : nil)
        }
    }
}

struct macOSSettings_Previews: PreviewProvider {
    static var previews: some View {
        macOSSettings()
    }
}
