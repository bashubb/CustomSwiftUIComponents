//
//  User.swift
//  FilteringList
//
//  Created by HubertMac on 20/02/2024.
//

import Foundation

import Foundation

struct User: Codable, Identifiable {
    let id: UUID
    let name: String
    let company: String
    let email: String
    let phone: String
    let address: String
}
