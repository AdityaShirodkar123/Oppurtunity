//
//  AddOppur.swift
//  Op1
//
//  Created by Aditya Shirodkar on 10/30/21.
//

import SwiftUI



struct AddOppur: View {
    @State public var age = Opening().age
    @State public var gender = Opening().gender
    @State public var grade = "11"
    @State public var highSchool = true
    @State public var interests = "Volunteering"
    @State public var zipCode = "08820"
    init(){
            UITableView.appearance().backgroundColor = .clear
        }
    
    var body: some View {
        NavigationView {
        
            Form {
                Section(header: Text("Gender")){
                    TextField("Male, Female, Other", text: $gender)
                }
                
                Section(header: Text("Age/Grade")){
                    Toggle(isOn: $highSchool) {
                        Text("Are you in High School?")
                    }
                    if highSchool == true {
                        TextField("Grade Level", text: $grade)
                    } else {
                        TextField("Age", text: $age)
                    }
                    
                }
                Section(header: Text("Zip Code")){
                    TextField("Zip Code", text: $zipCode)
                }
            }.background(Color(.systemGray6)).navigationBarTitleDisplayMode(.inline).navigationTitle("Edit Profile").foregroundColor(.blue)
        }.background(Color(.blue)).navigationBarBackButtonHidden(true).navigationBarTitleDisplayMode(.inline)
    }
}

struct AddOppur_Previews: PreviewProvider {
    static var previews: some View {
        AddOppur()
    }
}
