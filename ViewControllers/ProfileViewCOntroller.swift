//
//  ProfileViewCOntroller.swift
//  PartyOrganizer
//
//  Created by Dusan Mitrasinovic on 8/17/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    var member: Member?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        if let member = member {
            nameLabel.text = member.username
            genderLabel.text = member.gender
            emailLabel.text = member.email
        }
    }
    
}
