//
//  MembersViewController.swift
//  PartyOrganizer
//
//  Created by Dusan Mitrasinovic on 8/17/21.
//

import UIKit

class MembersViewController: UITableViewController {
    var members = [Member]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Members"
        members = PartiesData.shared.members
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveTapped))
    }
    
    @objc func saveTapped() {
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let member = members[indexPath.row]
        cell.textLabel?.text = member.username
        cell.imageView?.image = .remove
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let member = members[indexPath.row]
        let profileViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "profileVC") as! ProfileViewController
        profileViewController.member = member
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       if editingStyle == .delete {
           members.remove(at: indexPath.row)
           PartiesData.shared.deleteMember(indexPath)
           tableView.deleteRows(at: [indexPath], with: .fade)
       }
   }
    
    
}
