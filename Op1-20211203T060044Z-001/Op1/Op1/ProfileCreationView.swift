//
//  ContentView.swift
//  Op1
//
//  Created by Aditya Shirodkar on 10/16/21.
//

import SwiftUI
import SafariServices

struct HomeView: View {
    @State public var addedProfile = false
    var body: some View {
        var youthPrograms = loadCSV(from: "tcm24-43549_XLS_Youth_Service_Providers_10152019")
        VStack {
            Text("Home Page").font(.largeTitle).bold()
            Spacer()
            Spacer()
            Text("Nearby Programs:").font(.title3).position(x: 207, y: 70)
            ZStack {
                Rectangle().padding(30.0).padding(.vertical, 50.0).background(Color(.systemBlue)).cornerRadius(15.0)
                List(youthPrograms) { program in
                    NavigationLink(destination: DetailView(existingItem: program)) {
                        Text(program.organizationName)
                    }.navigationBarTitleDisplayMode(.inline)
                        .navigationBarItems(trailing:
                                                NavigationLink(destination: DetailView(existingItem: nil)) {
                            Image(systemName: "plus")
                                .resizable()
                                .padding(6)
                                .frame(width: 24, height: 24)
                                .background(Color.blue)
                                .clipShape(Circle())
                                .foregroundColor(.white)
                        } )
                }
            }.padding(.vertical, 200.0).padding(.horizontal, 30.0).cornerRadius(30.0).position(x: 207, y: 50)
            Text("Pending Programs:").font(.title3).position(x: 207, y: 40)
            ZStack {
                Rectangle().padding(30.0).padding(.vertical, 50.0).background(Color(.systemBlue)).cornerRadius(15.0).foregroundColor(Color(.systemBlue))
                if (addedProfile) {
                    List(customProgram) { program in
                        NavigationLink(destination: DetailView(existingItem: program)) {
                            Text(program.organizationName)
                        }.navigationBarTitleDisplayMode(.inline)
                            .navigationBarItems(trailing:
                                                    NavigationLink(destination: DetailView(existingItem: nil)) {
                                Image(systemName: "plus")
                                    .resizable()
                                    .padding(6)
                                    .frame(width: 24, height: 24)
                                    .background(Color.blue)
                                    .clipShape(Circle())
                                    .foregroundColor(.white)
                            } )
                    }
                } else {
                    NavigationLink(destination: ProfileEditor(), label: {
                        Text("Click to Add Oppurtunities").foregroundColor(.white).bold().font(.title)
                    })
                }
            }.padding(.vertical, 200.0).padding(.horizontal, 30.0).cornerRadius(30.0).position(x: 207, y:20)
            
        }
    }
}

struct SearchView: View {
    @State private var search : String = ""
    var youthPrograms = loadCSV(from: "tcm24-43549_XLS_Youth_Service_Providers_10152019")
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $search)
                Button(action: {search = ""}, label: {
                    Image(systemName: "xmark.circle.fill").padding(.vertical)
                })
            }.padding().background(Color(.systemGray6)).frame(height: 40).cornerRadius(13).padding(.horizontal)
            Spacer()
            List(youthPrograms) { program in
                NavigationLink(destination: DetailView(existingItem: program)) {
                    Text(program.organizationName)
                }
            }.navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing:
                                        NavigationLink(destination: DetailView(existingItem: nil)) {
                    Image(systemName: "plus")
                        .resizable()
                        .padding(6)
                        .frame(width: 24, height: 24)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                } )
        }.padding()
    }
}

struct ProfileCreationView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            SearchView()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            ProfileEditor()
                .tabItem{
                    Image(systemName: "plus")
                    Text("Add")
                }
        }.navigationBarTitleDisplayMode(.inline).navigationBarBackButtonHidden(true).foregroundColor(.blue)
    }
}

struct CustomView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 30.0) {
            HStack {
                Text("Website:")
                Text("congressionalappchallenge.us").foregroundColor(Color(.systemBlue))
            }
        }
    }
}

struct DetailView: View {
    var existingItem: CareerOneStopYouthPrograms?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30.0) {
            HStack {
                if (existingItem?.websiteURL != "") {
                    Text("Website:")
                }
                if (existingItem?.websiteURL != "") {
                    Text("\(existingItem!.websiteURL)").foregroundColor(Color(.systemBlue))
                }
            }
            
            if (existingItem?.organizationPhone != "") {
                Text("Phone Number: \(existingItem!.organizationPhone)")
            }
            
            if (existingItem?.organizationEmail != "") {
                HStack {
                    Text("Email address:")
                    Text((existingItem!.organizationEmail))
                }
            }
            
            if ((existingItem?.address1 != "") && (existingItem?.city != "") && (existingItem?.state != "")) {
                HStack {
                    Text("Address: ")
                    Text("\(existingItem!.address1), \(existingItem!.city), \(existingItem!.state), \(existingItem!.zipCode), United States")
                }
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCreationView()
    }
}
