//
//  LeaguesVC.swift
//  The Sports App
//
//  Created by Mohamed Azooz on 06/06/2022.
//

import UIKit
import Kingfisher

class LeaguesVC: UITableViewController {

    var leaguesList = [League]()
    var leaguesViewModel : LeaguesViewModel?
    var selectedSport = String()
     
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = viewControllerTitle.leaguesVCTitle
        
        getAllLeagues()
        
        // Register League Cell
        tableView.register(UINib(nibName: cellNibName.leagueCell, bundle: nil), forCellReuseIdentifier: cellIdentifierName.leaguesCell)
        
        // To Remove the TableView Seperator
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }

    // MARK: - Table view data source
    
    // Number of Sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    // Number of Rows in Each Sections
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return leaguesList.count
    }

    // Cell for Row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifierName.leaguesCell, for: indexPath) as? LeagueCell else {return UITableViewCell ()}
        
        let url = URL(string: leaguesList[indexPath.row].strBadge ?? "")
        cell.leagueBadgeImage.kf.indicatorType = .activity
        cell.leagueBadgeImage.kf.setImage(with: url, placeholder: UIImage(named: imagePlaceholder.placeholder))
        cell.leagueNameLabel.text = leaguesList[indexPath.row].strLeague
        cell.youtubeBtn.tag = indexPath.row
        cell.youtubeBtn.addTarget(self, action: #selector(youTubeButtonClicked), for: .touchUpInside)
        
        return cell
    }
    // Function For YouTube Btn
    @objc func youTubeButtonClicked(sender : UIButton) {
        let buttonRow = sender.tag
        let youtubeId = leaguesList[buttonRow].strYoutube
        if youtubeId == "" {
            let alert = Alerts.instance.showAlert(title: "No Video", message: "There is no avaible video for this league") 
            self.present(alert, animated: true, completion: nil)
        } else {
            guard  let youtubeUrl = URL(string:"https://\(youtubeId!)") else {return}
            if UIApplication.shared.canOpenURL(youtubeUrl) {
                UIApplication.shared.open(youtubeUrl)
            }
        }
    }
    // Did Select Method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard : UIStoryboard = UIStoryboard(name: Storyboards.main, bundle: nil)
        let leagueDetailsVC = storyboard.instantiateViewController(withIdentifier: VCs.LeaguesDetailsVC) as! LeaguesDetailsVC
        leagueDetailsVC.leagueId = leaguesList[indexPath.row].idLeague ?? ""
        leagueDetailsVC.leagueName = leaguesList[indexPath.row].strLeague ?? ""
        leagueDetailsVC.favLeague = leaguesList[indexPath.row]
        leagueDetailsVC.modalPresentationStyle = .fullScreen
        self.present(leagueDetailsVC, animated: true, completion: nil)
        
    }
    // Height For Row
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
}

// MARK: - Get All Leagues Method
extension LeaguesVC {
    func getAllLeagues() {
        leaguesViewModel = LeaguesViewModel()
        leaguesViewModel?.BindingParsingclouser = { [weak self] in
            DispatchQueue.main.async {
                self?.leaguesList = self?.leaguesViewModel?.leaguesList ?? []
                self?.tableView.reloadData()
            }
        }
        leaguesViewModel?.getAllLeagues(parameters: selectedSport)
    }
}
