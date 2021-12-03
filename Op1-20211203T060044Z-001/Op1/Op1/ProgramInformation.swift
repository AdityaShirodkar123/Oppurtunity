//
//  ProgramInformation.swift
//  Op1
//
//  Created by Aditya Shirodkar on 10/26/21.
//

import SwiftUI

struct ProgramInformation: View {
    var forOrganizationName: String
    var programs = loadCSV(from: "tcm24-43549_XLS_Youth_Service_Providers_10152019.csv")
    var body: some View {
      
        
    }
    //Organization Name,Address_1,Address_2,City,State,Zipcode,Organization Phone,Organization email,Fax,Website URL
    
}

struct ProgramInformation_Previews: PreviewProvider {
    static var previews: some View {
        ProgramInformation()
    }
}
