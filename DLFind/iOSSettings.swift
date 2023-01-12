//
//  iOSSettings.swift
//  DLFind
//
//  Created by David Empire on 1/12/23.
//

#if os(iOS)
import SwiftUI

struct iOSSettings: View {
    @AppStorage("isDarkMode") private var isDarkMode = 0
    
    var body: some View {
            VStack {
                Form {
                    Picker("Appearance", selection: $isDarkMode) {
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
            }.navigationTitle("Settings")
        }
    }

struct iOSSettings_Previews: PreviewProvider {
    static var previews: some View {
        iOSSettings()
    }
}
#endif
