//
//  PartiesData.swift
//  PartyOrganizer
//
//  Created by Dusan Mitrasinovic on 8/15/21.
//

import Foundation

class PartiesData {
    static let shared = PartiesData()
    
    var parties = [Party(name: "White sensation", date: "21-08-2021", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "),
               Party(name: "White sensation 2", date: "01-09-2021", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
               Party(name: "White sensation3", date: "21-08-2021", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
    ]
    var members = [Member(id: 12, username: "Dusan", cell: "", photo: "", email: "d.mitrasinovic@gmail.com", gender: "male", aboutMe: "dsada dasdasd dasdasd adssad"),
                   Member(id: 32, username: "John", cell: "", photo: "", email: "d.mitra@gmail.com", gender: "male", aboutMe: "dsada dasdasd dasdasd adssaddsad dasda dasdsadsa"),
                   Member(id: 4, username: "Peter", cell: "", photo: "", email: "mitra@gmail.com", gender: "male", aboutMe: "dsada dasdasd dasdasd adssadsa dasdsa dasdada")]
    
    
    func addNewParty(_ party: Party) {
        parties.append(party)
    }
    
    func deleteMember(_ indexPath: IndexPath) {
        members.remove(at: indexPath.row)
    }
    
}
