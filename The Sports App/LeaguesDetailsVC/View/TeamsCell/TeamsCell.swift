//
//  TeamsCell.swift
//  The Sports App
//
//  Created by Mohamed Azooz on 07/06/2022.
//

import UIKit
import Kingfisher

class TeamsCell: UITableViewCell {
    
    //Teams CollectionView OutLet
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    
    var teamsList = [Team]()
    var leagueDetailsVM : LeagueDetailsVM?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Confirm DataSourse & Delegate of Results CollectionView
        teamsCollectionView.dataSource = self
        teamsCollectionView.delegate = self
        
        // Registration of Teams CollectionView Cell
        teamsCollectionView.register(UINib(nibName: cellNibName.teamCell, bundle: nil), forCellWithReuseIdentifier: cellIdentifierName.teamCell)
        
        // Corner For View
        contentView.layer.cornerRadius = 20
        
    }
}
// MARK: - Collection View DataSourse & Delegate Methods
extension TeamsCell : UICollectionViewDelegate , UICollectionViewDataSource {
    // Number of Items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamsList.count
    }
    // Cell For Item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = teamsCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifierName.teamCell, for: indexPath) as! TeamCell
        
        let url = URL(string: teamsList[indexPath.row].strTeamBadge ?? "")
        cell.teamImageView.kf.indicatorType = .activity
        cell.teamImageView.kf.setImage(with: url, placeholder: UIImage(named: imagePlaceholder.placeholder))
        return cell
    }
    // Did Select At Item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard : UIStoryboard = UIStoryboard(name: Storyboards.main, bundle: nil)
        let teamDetailsVC = storyboard.instantiateViewController(withIdentifier: VCs.teamDetailsVC) as! TeamDetailsVC
        
        teamDetailsVC.team = teamsList[indexPath.row]
        teamDetailsVC.modalPresentationStyle = .fullScreen
        
        UIApplication.topViewController()?.present(teamDetailsVC, animated: true, completion: nil)
    }
}

// MARK: - Get Teams Methods
extension TeamsCell {
    // To Get League ID for the Chosen League from LeaguesVC
    func getTeamName(name: String?)  {
        self.getAllTeams(leagueName: name ??  "" )
    }
    // To Get all Teams
    func getAllTeams(leagueName : String ) {
        leagueDetailsVM = LeagueDetailsVM()
        leagueDetailsVM?.BindingParsingclouser = { [weak self] in
            DispatchQueue.main.async {
                self?.teamsList = self?.leagueDetailsVM?.teamsList ?? []
                self?.teamsCollectionView.reloadData()
            }
        }
        leagueDetailsVM?.checkDataClouser = { [weak self] in
            self?.teamsCollectionView.isHidden = true
        }
        leagueDetailsVM?.getAllTeams(parameters: leagueName)
    }
}
