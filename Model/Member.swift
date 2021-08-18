//
//  Member.swift
//  PartyOrganizer
//
//  Created by Dusan Mitrasinovic on 8/16/21.
//

import Foundation

struct Member: Decodable {
    let id: Int
    let username: String
    let cell: String
    let photo: String
    let email: String
    let gender: String
    let aboutMe: String
}

struct MemberResponse: Decodable {
    let profiles: [Member]
}

