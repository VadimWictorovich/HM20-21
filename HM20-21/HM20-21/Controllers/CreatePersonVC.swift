//
//  CreatePersonVC.swift
//  HM20-21
//
//  Created by Вадим Игнатенко on 18.09.23.
//

import UIKit

class CreatePersonVC: UIViewController {
    var person: Person?
    @IBOutlet var nameLabel: UILabel! {
        didSet {
            nameLabel.text = "Name: \(person?.name ?? "No data")"
        }
    }

    @IBOutlet var surnameLabel: UILabel! {
        didSet {
            surnameLabel.text = "Surname: \(person?.sureName ?? "No data")"
        }
    }

    @IBOutlet var emailLabel: UILabel! {
        didSet {
            emailLabel.text = "Email: \(person?.email ?? "No data")"
        }
    }

    @IBOutlet var phoneLabel: UILabel! {
        didSet {
            phoneLabel.text = "Phone Number: \(person?.phoneNumber ?? "No data")"
        }
    }
}
