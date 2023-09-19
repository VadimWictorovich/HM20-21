//
//  SecondTVC.swift
//  HM20-21
//
//  Created by Вадим Игнатенко on 18.09.23.
//

import UIKit

class SecondTVC: UITableViewController {
    
    let persons = PersonData.createPersons().sorted { a, b -> Bool in a.name < b.name }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let person = persons[section]
        return person.name + " " + person.sureName
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let person = persons[section]

        let label = UILabel()
        label.backgroundColor = .lightGray
        label.text = person.name + " " + person.sureName
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)

        return label
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let person = persons[indexPath.section]
        cell.textLabel?.text = indexPath.row == 0 ? person.email : person.phoneNumber
        return cell
    }
}
