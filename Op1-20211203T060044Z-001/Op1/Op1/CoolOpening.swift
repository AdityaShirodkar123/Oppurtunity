//
//  CoolOpening.swift
//  Op1
//
//  Created by Aditya Shirodkar on 10/18/21.
//

import SwiftUI

struct CoolOpening: View {
    var body: some View {
        
        var existingItem: CareerOneStopYouthPrograms?
        
        var body: some View {
            ZStack {
            Text((existingItem != nil) ? "Address 1: \(existingItem!.address1)" : "")
            }
        }
    }
}

struct CoolOpening_Previews: PreviewProvider {
    static var previews: some View {
        CoolOpening()
    }
}
