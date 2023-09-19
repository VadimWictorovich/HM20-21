//
//  FirstTVC.swift
//  HM20-21
//
//  Created by Вадим Игнатенко on 18.09.23.
//

import UIKit

class FirstTVC: UITableViewController {
    var didSelectItem: ((Person) -> ())?
    var persons = PersonData.createPersons().sorted { a, b -> Bool in
        a.sureName < b.sureName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isEditing = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let person = persons[indexPath.row]
        cell.textLabel?.text = person.sureName
        cell.detailTextLabel?.text = person.name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let per = persons[indexPath.row]
        didSelectItem?(per)
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "CreatePersonVC") as? CreatePersonVC else { return }
        didSelectItem = { [weak self] per in
            vc.person = per
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedItem = persons.remove(at: sourceIndexPath.row)
        persons.insert(movedItem, at: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            persons.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
