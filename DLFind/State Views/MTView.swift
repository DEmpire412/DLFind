//
//  MTView.swift
//  DLFind
//
//  Created by David Empire on 12/17/22.
//

import SwiftUI

struct MTView: View {
    @State private var DLNumber: String = ""
    // Variable for user-inputted text field
    
    var body: some View {
        ScrollView {
            VStack {
                // User-inputted text field
                TextField("Driver's License Number (only 13-character MT DL numbers supported)", text: $DLNumber)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // Defines and displays month of birth
                let monthOfBirth: Int = Int(DLNumber[0..<2]) ?? 0
                if (monthOfBirth == 1) {
                    Text("Month of Birth: January")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else if (monthOfBirth == 2) {
                    Text("Month of Birth: February")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else if (monthOfBirth == 3) {
                    Text("Month of Birth: March")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else if (monthOfBirth == 4) {
                    Text("Month of Birth: April")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else if (monthOfBirth == 5) {
                    Text("Month of Birth: May")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else if (monthOfBirth == 6) {
                    Text("Month of Birth: June")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else if (monthOfBirth == 7) {
                    Text("Month of Birth: July")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else if (monthOfBirth == 8) {
                    Text("Month of Birth: August")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else if (monthOfBirth == 9) {
                    Text("Month of Birth: September")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else if (monthOfBirth == 10) {
                    Text("Month of Birth: October")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else if (monthOfBirth == 11) {
                    Text("Month of Birth: November")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else if (monthOfBirth == 12) {
                    Text("Month of Birth: December")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else {
                    Text("Month of Birth: ")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                // Defines and displays year of birth
                let yearOfBirth: String = DLNumber[5..<9]
                Text("Year of Birth: " + yearOfBirth)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                    .padding(20.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Defines and displays date of birth
                let dateOfBirth: String = DLNumber[12..<13]
                Text("Date of Birth: " + dateOfBirth)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                    .padding(20.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Enables text selection for all the instances of text
            }.textSelection(.enabled)
                .navigationTitle("Montana")
        }
    }
    

    struct MTView_Previews: PreviewProvider {
        static var previews: some View {
            MTView()
        }
    }
}
