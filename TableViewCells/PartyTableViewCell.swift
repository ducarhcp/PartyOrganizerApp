//
//  PartyTableViewCell.swift
//  PartyOrganizer
//
//  Created by Dusan Mitrasinovic on 8/15/21.
//

import UIKit

class PartyTableViewCell: UITableViewCell {
    @IBOutlet weak var partyNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
