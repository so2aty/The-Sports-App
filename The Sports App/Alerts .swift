//
//  Alerts .swift
//  The Sports App
//
//  Created by Mohamed Azooz on 15/06/2022.
//

import UIKit


class Alerts {
    
    static let instance = Alerts()
    
    func showAlert ( title : String , message: String) -> UIAlertController {
        let alert : UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        return alert
    }
    
    
}
