//
//  Critter.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/10/23.
//

import Foundation
import SwiftUI
import UIKit

struct Critter: Identifiable, Codable {
    let id = UUID()
    var name: String
    let url: String
    var age: Int?
    var showAge: Bool = true
    var tasks: [String]?
    var contactName: String?
    var contactPhone: String?
    var showContact: Bool = true
    var emergencyContact: String?
    var showEmergencyContact: Bool = true
    
static let exampleCritterData = [Critter(name: "Ziggy",
                                         url: "www.google.com",
                                         age: 6, tasks: nil,
                                         contactName: "Mr. Grumpy",
                                         contactPhone: "215-888-9000",
                                         showContact: true,
                                         emergencyContact: "911",
                                         showEmergencyContact: true)]
}
