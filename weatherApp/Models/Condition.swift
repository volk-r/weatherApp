//
//  Condition.swift
//  weatherApp
//
//  Created by Roman Romanov on 16.05.2025.
//

import Foundation

struct Condition: Codable, Sendable, Hashable {
    let text: String
    let icon: String
}
