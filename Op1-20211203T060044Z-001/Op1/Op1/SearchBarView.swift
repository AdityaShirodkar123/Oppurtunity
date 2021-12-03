//
//  SearchBarView.swift
//  Op1
//
//  Created by Aditya Shirodkar on 10/23/21.
//

import SwiftUI

struct SearchBarView: View {
    @State private var searchText : String
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color("SearchBar"))
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search...", text: $searchText)
            }
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
