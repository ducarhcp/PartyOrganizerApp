//
//  Router.swift
//  PartyOrganizer
//
//  Created by Dusan Mitrasinovic on 8/16/21.
//

import Foundation

enum Router {
    case getMemberData
    
    var method: String {
        switch self {
        case .getMemberData:
            return "GET"
        }
    }
    
    var path: String {
        switch self {
        case  .getMemberData:
            return "http://api-coin.quantox.tech/profiles.json"
        }
    }
}
