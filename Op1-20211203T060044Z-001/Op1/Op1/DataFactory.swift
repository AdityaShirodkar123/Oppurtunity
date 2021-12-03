//
//  DataFactory.swift
//  Op1
//
//  Created by Aditya Shirodkar on 10/23/21.
//

import Foundation


//Career One Stop
struct CareerOneStopYouthPrograms: Identifiable {
    var organizationName: String = ""
    var address1 : String = ""
    var address2 : String = ""
    var city : String = ""
    var state : String = ""
    var zipCode : String = ""
    var organizationPhone : String = ""
    var organizationEmail : String = ""
    var fax : String = ""
    var websiteURL : String = ""
    var organizationInfo = [String]()
    var id = UUID()
    
    init (raw: [String]) {
        organizationName = raw[0]
        address1 = raw[1]
        address2 = raw[2]
        city = raw[3]
        state = raw[4]
        zipCode = raw[5]
        organizationPhone = raw[6]
        organizationEmail = raw[7]
        fax = raw[8]
        websiteURL = raw[9]
    }
}

func loadCSV(from csvName: String) -> [CareerOneStopYouthPrograms] {
    var csvToStruct = [CareerOneStopYouthPrograms]()
    
    guard let filePath = Bundle.main.path(forResource: csvName, ofType: "csv") else {
        print("error")
        return []
    }
    
    var data = ""
    do {
        data = try String(contentsOfFile: filePath)
    } catch {
        print(error)
        return []
    }
    
    
    var rows = data.components(separatedBy: "\n")
    
    let columnCount = rows.first?.components(separatedBy: ",").count
    rows.removeFirst()
    
    for row in rows {
        let csvColumns = row.components(separatedBy: ",")
        if csvColumns.count == columnCount {
            let programsStruct = CareerOneStopYouthPrograms.init(raw: csvColumns)
            csvToStruct.append(programsStruct)
        }
    }
    
    return csvToStruct
}
