//
//  FavoriteLeagueVC.swift
//  The Sports App
//
//  Created by Mohamed Azooz on 05/06/2022.
//

import UIKit
import Kingfisher
import Network

class FavoriteLeagueVC: UIViewController {

    @IBOutlet weak var favLeaguesTableView: UITableView!
    
    var leagues = [CoreDataLeague]()
    var favoriteVM : FavLeagueVM?
    let monitor = NWPathMonitor()
    
    var checkNetworkOKClouser : () -> Void = {}
    var checkNetworkNotOKClouser : () -> Void = {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Favorite Cell Registration
        favLeaguesTableView.register(UINib(nibName: cellNibName.favLeagueCell, bundle: nil), forCellReuseIdentifier: cellIdentifierName.favLeagueCell)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favLeaguesTableView.isHidden = false
        super.viewWillAppear(animated)
        leagues.removeAll()
        leagues = FavLeagueVM.instance.getData()
        favLeaguesTableView.reloadData()
        checkFavList ()
    }
}


// MARK: - Favorite Table View DataSource and Delegate Methods

// Number of Rows
extension FavoriteLeagueVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
// Cell of Rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favLeaguesTableView.dequeueReusableCell(withIdentifier: cellIdentifierName.favLeagueCell, for: indexPath) as! FavLeagueCell
        
        let imageUrl = URL(string: leagues[indexPath.row].strBadge ?? "")
        
        cell.leagueNameLabel.text = leagues[indexPath.row].strLeague
        cell.leagueImageView.kf.indicatorType = .activity
        cell.leagueImageView.kf.setImage(with: imageUrl, placeholder: UIImage(named: imagePlaceholder.placeholder))
        cell.youtubeBtn.tag = indexPath.row
        cell.youtubeBtn.addTarget(self, action: #selector(youTubeButtonClicked), for: .touchUpInside)
        return cell
    }
    
// Method for YouTube Btn
    @objc func youTubeButtonClicked(sender : UIButton) {
        let buttonRow = sender.tag
        let youtubeId = leagues[buttonRow].strYoutube
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
    
// Height of Rows
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }

// Did Seletct Row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard : UIStoryboard = UIStoryboard(name: Storyboards.main, bundle: nil)
        let leagueDetailsVC = storyboard.instantiateViewController(withIdentifier: VCs.LeaguesDetailsVC) as! LeaguesDetailsVC
        leagueDetailsVC.leagueId = leagues[indexPath.row].idLeague ?? ""
        leagueDetailsVC.leagueName = leagues[indexPath.row].strLeague ?? ""
        
        // Check Netowork Connection
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                DispatchQueue.main.sync {
                    leagueDetailsVC.modalPresentationStyle = .fullScreen
                    self.present(leagueDetailsVC, animated: true, completion: nil)
                }
                print("Connected")
            } else {
                DispatchQueue.main.sync {
                    let alert = Alerts.instance.showAlert(title: "No Connection", message: "Please Check Your Internet Connection")
                    self.present(alert, animated: true, completion: nil)
                }
                print("Not Connected")
            }
            print(path.isExpensive)
        }
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }
    
// Delete Row Method
    internal func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Delete")
        }
        FavLeagueVM.instance.deletLeague(index: indexPath.row)
        leagues.remove(at: indexPath.row)
        self.favLeaguesTableView.deleteRows(at: [indexPath], with: .right)
        self.favLeaguesTableView.reloadData()
        checkFavList ()
    }
}

// MARK: -  Methods
extension FavoriteLeagueVC {
    // Function to check if there is leaguse in the list or not
    func checkFavList () {
        if leagues.count == 0 {
            favLeaguesTableView.isHidden = true
        }
    }
}




