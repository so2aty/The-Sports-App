//
//  TeamDetailsVC.swift
//  The Sports App
//
//  Created by Mohamed Azooz on 05/06/2022.
//

import UIKit
import Kingfisher

class TeamDetailsVC: UIViewController {
    //OutLets
    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var tesmCountryLabel: UILabel!
    
    var team : Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let teamLogoUrl = URL(string: team?.strTeamBadge ?? "")
        teamImageView.kf.setImage(with: teamLogoUrl, placeholder: UIImage(named: imagePlaceholder.placeholder))
        teamNameLabel.text = "Team Name : \(team?.strTeam ?? "")"
        tesmCountryLabel.text = "Team Country : \(team?.strCountry ?? "")"
        teamImageView.layer.cornerRadius = 20
    }
    
    // Back Button Action
    @IBAction func backBtnPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
