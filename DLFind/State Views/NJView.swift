//
//  NJView.swift
//  DLFind
//
//  Created by David Empire on 12/17/22.
//

import SwiftUI

struct NJView: View {
    // Variable for user-inputted text field
    @State private var DLNumber: String = ""

    
    var body: some View {
        ScrollView {
            VStack {
                // User-inputted text field
                TextField("Driver's License Number (include spaces)", text: $DLNumber)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // Defines and displays first initial of last name
                let lnFirstInitial: String = DLNumber[0]
                Text("Last Name First Initial: " + lnFirstInitial)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                    .padding(20.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Defines and displays gender
                let gender: String = DLNumber[12..<14]
                let genInt: Int = Int(gender) ?? 0
                if (genInt >= 1 && genInt <= 12) {
                    Text("Gender: Male")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else if (genInt >= 50) {
                    Text("Gender: Female")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else {
                    Text("Gender: ")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                // Defines current year
                let year = Calendar.current.component(.year, from: Date())
                
                // Defines and displays year of birth
                let yearOfBirth: Int = Int(DLNumber[14..<16]) ?? 0
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
                
                // Defines and displays age
                if (yearOfBirth <= year - 2000), !DLNumber.isEmpty {
                    let age = year - (yearOfBirth + 2000)
                    Text("Age: " + String(age))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else if (yearOfBirth >= year - 2000), !DLNumber.isEmpty {
                    let age = year - (yearOfBirth + 1900)
                    Text("Age: " + String(age))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else {
                    let age: String = ""
                    Text("Age: " + String(age))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                // Defines and displays eye color
                if (DLNumber[16]) == "1" {
                    let eyeColor: String = "Black"
                    Text("Eye Color: " + eyeColor)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else if (DLNumber[16]) == "2" {
                    let eyeColor: String = "Brown"
                    Text("Eye Color: " + eyeColor)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else if (DLNumber[16]) == "3" {
                    let eyeColor: String = "Grey"
                    Text("Eye Color: " + eyeColor)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else if (DLNumber[16]) == "4" {
                    let eyeColor: String = "Blue"
                    Text("Eye Color: " + eyeColor)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else if (DLNumber[16]) == "5" {
                    let eyeColor: String = "Hazel"
                    Text("Eye Color: " + eyeColor)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else if (DLNumber[16]) == "6" {
                    let eyeColor: String = "Green"
                    Text("Eye Color: " + eyeColor)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                else {
                    Text("Eye Color: ")
                        .fontWeight(.medium)
                        .padding(20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
            // Enables text selection for all the instances of text
            }.textSelection(.enabled)
                .navigationTitle("New Jersey")
        }
    }
    

    struct NJView_Previews: PreviewProvider {
        static var previews: some View {
            NJView()
        }
    }
}
