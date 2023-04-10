//
//  FileManager.swift
//  Critter Log
//
//  Created by Josh Gdovin on 4/10/23.
//

import Foundation

public extension FileManager {
  static var documentsDirectoryURL: URL {
    return `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
  }
}
