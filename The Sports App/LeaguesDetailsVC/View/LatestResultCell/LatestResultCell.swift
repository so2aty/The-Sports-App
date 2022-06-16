//
//  LatestResultCell.swift
//  The Sports App
//
//  Created by Mohamed Azooz on 07/06/2022.
//

import UIKit

class LatestResultCell: UITableViewCell {
    //Latest Result CollectionView OutLet
    @IBOutlet weak var ResultsCollectionView: UICollectionView!
    
    var eventsList = [Event]()
    var leagueDetailsVM : LeagueDetailsVM?
    
    private let itemsPerRow: CGFloat = 1
    private let sectionInsets = UIEdgeInsets(top: 15.0, left: 0, bottom: 15.0, right: 0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Confirm DataSourse & Delegate of Results CollectionView
        ResultsCollectionView.dataSource = self
        ResultsCollectionView.delegate   = self
        
        // Registration of Latest Reults CollectionView Cell
        ResultsCollectionView.register(UINib(nibName: cellNibName.resultCell, bundle: nil), forCellWithReuseIdentifier: cellIdentifierName.resultCell)
        
    }
}
// MARK: - Collection View DataSourse & Delegate Methods
extension LatestResultCell: UICollectionViewDelegate , UICollectionViewDataSource {
    // Number of Items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventsList.count
    }
    // Cell For Item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ResultsCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifierName.resultCell, for: indexPath) as! ResultCell
        
        guard let homeTeamName = eventsList[indexPath.row].strHomeTeam else {return cell}
        guard let awayTeamName = eventsList[indexPath.row].strAwayTeam else {return cell}
        
        guard let homeScore = eventsList[indexPath.row].intHomeScore else {return cell}
        guard let AwayScore = eventsList[indexPath.row].intAwayScore else {return cell}
        
        guard let date = eventsList[indexPath.row].dateEvent else {return cell}
        guard let time = eventsList[indexPath.row].strTime else {return cell}
        
        
        cell.teamsNamesLabel.text = ("\(homeTeamName) vs \(awayTeamName)")
        cell.teamsScoreLabel.text = ("\(homeScore) vs \(AwayScore)")
        cell.dateTimeLabel.text = ("Date : \(date) Time :  \(time)")
        
        return cell
    }
}

// MARK: - Collection View Flow Layout Methods
extension LatestResultCell : UICollectionViewDelegateFlowLayout {
    // To chose how many item per Row
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = UIScreen.main.bounds.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: 100)
    }
}

// MARK: - Get Lastest Results Methods
extension LatestResultCell {
    // To Get League ID for the Chosen League from LeaguesVC
    func getLeagueID(id: String?)  {
        self.getAllEvents(leagueID: id)
    }
    // To Get all the Latest Results
    func getAllEvents(leagueID: String?) {
        leagueDetailsVM = LeagueDetailsVM()
        leagueDetailsVM?.BindingParsingclouser = { [weak self] in
            DispatchQueue.main.async {
                self?.eventsList = self?.leagueDetailsVM?.eventsList ?? []
                self?.ResultsCollectionView.reloadData()
            }
        }
        leagueDetailsVM?.checkDataClouser = { [weak self] in
            self?.ResultsCollectionView.isHidden = true
        }
        leagueDetailsVM?.getAllEvents(parameters: leagueID ?? "")
    }
}
