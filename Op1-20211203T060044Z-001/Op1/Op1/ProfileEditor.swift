//
//  AddOppur.swift
//  Op1
//
//  Created by Aditya Shirodkar on 10/30/21.
//

import SwiftUI



struct ProfileEditor: View {
    @State var oppurtunityName = ""
    @State var email = ""
    @State var phone = ""
    @State var location = ""
    @State var website = ""
    init(){
            UITableView.appearance().backgroundColor = .clear
        }
    
    var body: some View {
        NavigationView {
        
            Form {
                Section(header: Text("Oppurtunity Name")){
                    TextField("Enter Name", text: $oppurtunityName)
                }
                Section(header: Text("Website")){
                    TextField("Enter Website URL", text: $website)
                }
                Section(header: Text("Email")){
                    TextField("Enter Email", text: $email)
                }
                Section(header: Text("Phone")){
                    TextField("Enter Phone Address", text: $phone)
                }
                Section(header: Text("Location")){
                    TextField("Enter Location", text: $location)
                }
                Section{
                    NavigationLink(destination: ProfileCreationView(), label:{
                        Text("Submit")
                    })
                }
            }.background(Color(.systemGray6)).navigationBarTitleDisplayMode(.inline).navigationTitle("Add Oppurtunity").foregroundColor(.blue)
        }.background(Color(.blue)).navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor()
    }
}
