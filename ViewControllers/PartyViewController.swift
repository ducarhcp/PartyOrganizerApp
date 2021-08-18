//
//  PartyViewController.swift
//  PartyOrganizer
//
//  Created by Dusan Mitrasinovic on 8/16/21.
//

import UIKit

class PartyViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var membersTableView: UITableView!
    private var members: [Member] = []
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Party"
        membersTableView.delegate = self
        membersTableView.dataSource = self
        nameTextField.delegate = self
        datePicker = UIDatePicker()
        setupDatePicker(datePicker: datePicker!)
        self.membersTableView.isHidden = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveTapped))
        loadData()
    }
    
    @IBAction func membersButtonPressed(_ sender: Any) {
        membersTableView.isHidden = false
    }
    
    private func loadData() {
        NetworkService.request(router: .getMemberData) { (result: (Result<MemberResponse, Error>)) in
            switch result {
            case .success(let memberData):
                print("Sucess")
                print(memberData.profiles)
            case .failure:
                print("Failuree")
            }
        }
    }
    
    private func setupDatePicker(datePicker: UIDatePicker) {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        dateTextField.inputView = datePicker
    }
    
    @objc private func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateLabel.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    @objc func saveTapped() {
        if let name = nameLabel.text, let date = dateLabel.text, let description = descriptionTextField.text {
            let party = Party(name: name, date: date, description: description)
            PartiesData.shared.addNewParty(party)
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension PartyViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        PartiesData.shared.members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let member = PartiesData.shared.members[indexPath.row]
        cell.accessoryType = .checkmark
        cell.textLabel?.text = member.username
        cell.imageView?.image = .remove
        
        return cell
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.nameLabel.text = nameTextField.text
    }
}
