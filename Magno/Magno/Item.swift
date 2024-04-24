//
//  Item.swift
//  Magno
//
//  Created by Gilberto Magno on 10/04/24.
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
