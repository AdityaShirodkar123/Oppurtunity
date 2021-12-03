//
//  Opening.swift
//  Op1
//
//  Created by Aditya Shirodkar on 10/16/21.
//

import SwiftUI


struct Opening: View {
    @State public var age = ""
    @State public var gender = ""
    @State public var grade = ""
    @State public var highSchool = false
    @State public var interest = ""
    @State public var zipCode = ""
    
    init(){
        UITableView.appearance().backgroundColor = .systemGray6
    }
    
    var body: some View {
        ZStack {
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
                    Section {
                        NavigationLink(destination: ProfileCreationView(), label:{
                            Text("Submit")
                        })
                    }
                }.foregroundColor(Color(.systemBlue)).navigationBarTitleDisplayMode(.inline).navigationTitle("Create Profile")
            }
        }
    }
    
    
}

struct Opening_Previews: PreviewProvider {
    static var previews: some View {
        Opening()
    }
}
