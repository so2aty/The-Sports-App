//
//  UpcomingEventsCell.swift
//  The Sports App
//
//  Created by Mohamed Azooz on 06/06/2022.
//

import UIKit

class UpcomingEventsCell: UITableViewCell {
    
    //Upcoming Events CollectionView OutLet
    @IBOutlet weak var upcomingEventsCollectionView: UICollectionView!
    
    var eventsList = [Event]()
    var leagueDetailsVM : LeagueDetailsVM?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Confirm DataSourse & Delegate of Upcoming Events CollectionView
        upcomingEventsCollectionView.dataSource = self
        upcomingEventsCollectionView.delegate = self
        
        // Registration of Upcoming Events CollectionView Cell
        upcomingEventsCollectionView.register(UINib(nibName: cellNibName.eventsCell, bundle: nil), forCellWithReuseIdentifier: cellIdentifierName.eventsCell)
    }
    
}

// MARK: - Collection View DataSourse & Delegate Methods
extension UpcomingEventsCell : UICollectionViewDelegate , UICollectionViewDataSource {
    
    // Number of Items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventsList.count
    }
    
    // Cell For Item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = upcomingEventsCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifierName.eventsCell, for: indexPath) as! EventsCell
        
        cell.eventNameLabel.text = eventsList[indexPath.row].strEvent
        cell.eventDateLabel.text = eventsList[indexPath.row].dateEvent
        cell.eventTimeLabel.text = eventsList[indexPath.row].strTime
        
        return cell
        
    }
}

// MARK: - Collection View Flow Layout Methods
extension UpcomingEventsCell : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 200)
    }
}

// MARK: - Get Upcoming Events Methods
extension UpcomingEventsCell {
    
    // To Get League ID for the Chosen League from LeaguesVC
    func getLeagueID(id: String?)  {
        self.getAllEvents(leagueID: id)
    }
    
    // To Get all the Events 
    func getAllEvents(leagueID: String?) {
        leagueDetailsVM = LeagueDetailsVM()
        leagueDetailsVM?.BindingParsingclouser = { [weak self] in
            DispatchQueue.main.async {
                self?.eventsList = self?.leagueDetailsVM?.eventsList ?? []
                self?.upcomingEventsCollectionView.reloadData()
            }
        }
        leagueDetailsVM?.checkDataClouser = { [weak self] in
            self?.upcomingEventsCollectionView.isHidden = true
        }
        leagueDetailsVM?.getAllEvents(parameters: leagueID ?? "")
    }
}
