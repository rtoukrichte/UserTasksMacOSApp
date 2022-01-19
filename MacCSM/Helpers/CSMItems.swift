//
//  SideBarItems.swift
//  MacCSM
//
//  Created by rtoukrichte on 18/01/2022.
//

import Foundation
import SwiftUI

public enum CSMItems: String, CaseIterable, Identifiable {
    
    public var id: String {
        return rawValue
    }
    
    public static var allCases: [CSMItems] {
        return [.users, .contact, .settings]
    }
    
    case users
    case contact
    case settings
    
    var name: String {
        switch self {
        case .users:
            return "Users"
        case .contact:
            return "Contact"
        case .settings:
            return "Settings"
        }
    }
    
    var icon: String {
        switch self {
        case .users:
            return "house"
        case .contact:
            return "music.note.list"
        case .settings:
            return "gear"
        }
    }
    
}


