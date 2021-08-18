//
//  PartiesTableViewController.swift
//  PartyOrganizer
//
//  Created by Dusan Mitrasinovic on 8/15/21.
//

import UIKit

class PartiesTableViewController: UITableViewController {
    var parties = [Party]()

    override func viewDidLoad() {
        super.viewDidLoad()
        parties = PartiesData.shared.parties
  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        parties = PartiesData.shared.parties
        tableView.reloadData()
    }
    
    @IBAction func addPartyButtonPressed(_ sender: UIBarButtonItem) {
        let partyViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "partyVC")
        self.navigationController?.pushViewController(partyViewController, animated: true)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parties.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PartyTableViewCell
        let party = parties[indexPath.row]
        cell.partyNameLabel.text = party.name
        cell.dateLabel.text = party.date
        cell.descriptionLabel.text = party.description
        
        return cell
    }
}
