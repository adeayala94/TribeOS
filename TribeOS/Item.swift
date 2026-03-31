//
//  Item.swift
//  TribeOS
//
//  Created by Alex de Ayala on 3/30/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
