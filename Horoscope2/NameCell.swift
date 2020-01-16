//
//  NameCell.swift
//  Horoscope2
//
//  Created by Juan Ceballos on 1/16/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class NameCell: UITableViewCell {
    
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(name: String)    {
        nameTextfield.text = name
        nameLabel.text = nameTextfield.text
    }
}
