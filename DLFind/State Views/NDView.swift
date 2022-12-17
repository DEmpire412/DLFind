//
//  NDView.swift
//  DLFind
//
//  Created by David Empire on 12/17/22.
//

import SwiftUI

struct NDView: View {
    // Variable for user-inputted text field
    @State private var DLNumber: String = ""

    
    var body: some View {
        ScrollView {
            VStack {
                // User-inputted text field
                TextField("Driver's License Number (include dashes)", text: $DLNumber)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // Defines and displays first three letters of last name
                let lnBeginning: String = DLNumber[0..<3]
                Text("Last Name First Three Letters: " + lnBeginning)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                    .padding(20.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Defines current year
                let year = Calendar.current.component(.year, from: Date())
                
                // Defines and displays year of birth
                let yearOfBirth: Int = Int(DLNumber[4..<6]) ?? 0
                if (year - yearOfBirth <= 1999), !DLNumber.isEmpty {
                    let yob = yearOfBirth + 1900
                    Text("Year of Birth: " + String(yob))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else if (year - yearOfBirth >= 2000), !DLNumber.isEmpty {
                    let yob = yearOfBirth + 2000
                    Text("Year of Birth: " + String(yob))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else {
                    Text("Year of Birth: ")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                // Enables text selection for all the instances of text
            }.textSelection(.enabled)
                .navigationTitle("North Dakota")
        }
    }
    

    struct NDView_Previews: PreviewProvider {
        static var previews: some View {
            NDView()
        }
    }
}
