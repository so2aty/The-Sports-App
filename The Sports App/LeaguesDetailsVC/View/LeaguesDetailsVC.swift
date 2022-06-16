//
//  LeaguesDetailsVC.swift
//  The Sports App
//
//  Created by Mohamed Azooz on 06/06/2022.
//

import UIKit

class LeaguesDetailsVC: UIViewController{
    
    
    @IBOutlet weak var leagesDetailsTableView: UITableView!
    @IBOutlet weak var favBtn: UIBarButtonItem!
    
    var leagueId: String?
    var leagueName: String?
    var favLeague : League?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Regisration of Upcoming Events Cell
        leagesDetailsTableView.register(UINib(nibName: cellNibName.upcomingEventsCell, bundle: nil), forCellReuseIdentifier: cellIdentifierName.upcomingEventsCell)
        
        // Regisration of Latest Result Cell
        leagesDetailsTableView.register(UINib(nibName: cellNibName.latestResultCell, bundle: nil), forCellReuseIdentifier: cellIdentifierName.latestResultCell)
        
        // Regisration of Teams Cell
        leagesDetailsTableView.register(UINib(nibName: cellNibName.teamsCell, bundle: nil), forCellReuseIdentifier: cellIdentifierName.teamsCell)
        
        self.leagesDetailsTableView.reloadData()
    }
    
    
// MARK: - Button Actions
    
    // Back Button
    @IBAction func backBtnPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // Favorite Button
    @IBAction func FavBtnPressed(_ sender: Any) {
        
        guard let favLeague = favLeague else {return}
        
        guard let league = favLeague.strLeague  else { return }
        guard let badge = favLeague.strBadge else { return }
        guard let youtube = favLeague.strYoutube else { return }
        guard let id = favLeague.idLeague else {return}
        
        
       // To Check if League is Added Already
        let favLeagues = FavLeagueVM.instance.getData()
        let filtered = favLeagues.filter({$0.idLeague == favLeague.idLeague})
        
        if filtered.isEmpty {
            FavLeagueVM.instance.addDataToCoreData(strLeague: league, strBadge: badge, strYoutube: youtube , idLeague: id)
            let alert =  Alerts.instance.showAlert(title: "Add To Favorite", message: "You Add The League To Favorites Succcefuly")
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert =  Alerts.instance.showAlert(title: "Add To Favorite", message: "This League is Added Before To Favorite")
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}


// MARK: - Table view data source & Delegate Methods
extension LeaguesDetailsVC : UITableViewDelegate , UITableViewDataSource {
    
    // Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    // Number of Rows in sections
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else {
            return 1
        }
    }
    
    // Title of sections
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        if section == 0 {
            return "Upcomming Events"
        } else if section == 1 {
            return "Latest Results"
        } else {
            return "Teams"
        }
    }
    // Title Text Color of sections
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        view.tintColor = UIColor(white: 0, alpha: 0)
        let header : UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .black
        
    }
    // Cell for Row in Each Section
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0  {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifierName.upcomingEventsCell, for: indexPath) as! UpcomingEventsCell
            cell.getLeagueID(id: self.leagueId)
            
            return cell
            
        } else if indexPath.section == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifierName.latestResultCell, for: indexPath) as! LatestResultCell
            cell.getLeagueID(id: self.leagueId)
            return cell
            
        } else if indexPath.section == 2{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifierName.teamsCell, for: indexPath) as! TeamsCell
            cell.getTeamName(name: self.leagueName)
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
    
    // Cell Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let  height = (self.view.frame.size.height / 3)
        return height
        
        
    }
    
}



