//
//  UserInfoTVC.swift
//  Horoscope2
//
//  Created by Juan Ceballos on 1/15/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class UserInfoTVC: UITableViewController {
    
    // array for sunsigns, dynamic tableview
    // view should appear
    
    var horoscopesLabels = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagattarius", "Capricorn", "Aquarius", "Pisces"]
    
    var horoscopes = [Horoscope]()
    
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
        guard let indexPath = tableView.indexPathForSelectedRow
            else    {
                fatalError()
        }
        
        let selectedSign = tableView.cellForRow(at: indexPath)?.textLabel?.text?.lowercased() ?? ""
        
        HoroscopeAPI.fetchHoroscope(horoscope: selectedSign) { (result) in
            switch result   {
            case .failure(let appError):
                print(appError)
            case .success(let horoscope):
                self.horoscopes = horoscope
                print(horoscope)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        horoscopesLabels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let signCell = tableView.dequeueReusableCell(withIdentifier: "signCell", for: indexPath) as? HoroscopeCell
            else    {
                fatalError()
        }
        
        
        
        let horoscope = horoscopesLabels[indexPath.row]
        
        signCell.configureCell(horoscope: horoscope)
        
        return signCell
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Sign"
        }
        else    {
            return "Name"
        }
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
    //}
    
    
}

extension UserInfoTVC: UITextFieldDelegate  {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        // textfield name text
        
        return true
    }
}
