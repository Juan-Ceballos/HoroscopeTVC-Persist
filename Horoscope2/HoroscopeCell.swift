//
//  HoroscopeCell.swift
//  Horoscope2
//
//  Created by Juan Ceballos on 1/16/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class HoroscopeCell: UITableViewCell    {
    
    @IBOutlet weak var signLabel: UILabel!

    func configureCell(horoscope: String)    {
        signLabel.text = horoscope
    }
    
    
}
