//
//  UserInfoTVC.swift
//  Horoscope2
//
//  Created by Juan Ceballos on 1/15/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class UserInfoTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let screenHeight = UIScreen.main.bounds.size.height
        return screenHeight / 16
    }
    
    func loadHoroscope()    {
        // aries should be horoscope pressed in tableview
        HoroscopeAPI.fetchHoroscope(horoscope: "aries") { (result) in
            switch result   {
            case .failure(let appError):
                print(appError)
            case .success(let horoscope):
                print(horoscope)
            }
        }
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }


    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
