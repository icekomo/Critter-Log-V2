//
//  WelcomeViewModel.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/10/23.
//

import Foundation
import SwiftUI

struct WelcomeViewModel {
    
    @EnvironmentObject var critterData: CritterData
    
    func loadCritters() {
        print("load critters")
        CritterData().loadCritters()
    }
    
//    func checkCritter() {
//        print(critterData.critters)
//    }
}
