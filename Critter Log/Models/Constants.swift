//
//  Constants.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/10/23.
//

import Foundation
import SwiftUI

enum Constants {
    enum General {
        public static let circleButton = CGFloat(56.0)
        public static let headerHeight = CGFloat(100.0)
    }
    
    enum Colors {
        case grayLight
        
        var color: Color {
            switch self {
            case .grayLight:
                return Color("GrayLight")
            }
        }
  
    }
}
