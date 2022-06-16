//
//  ViewController.swift
//  The Sports App
//
//  Created by Mohamed Azooz on 05/06/2022.
//

import UIKit
import Alamofire
import Kingfisher

class SportsVC: UIViewController {

    @IBOutlet weak var sportsCollectionView: UICollectionView!
    
    private let itemsPerRow: CGFloat = 2
    private let sectionInsets = UIEdgeInsets(top: 15.0, left: 0, bottom: 15.0, right: 0)
    
    var sportsList = [Sport]()
    var sportsViewModel : SportsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Title for VC
        self.title = viewControllerTitle.sportsVCTitle
        
        // Calling Load Data Function
        getAllSports()
        
        // sport Cell Registration
        sportsCollectionView.register(UINib(nibName:cellNibName.sportCell,bundle: nil), forCellWithReuseIdentifier: cellIdentifierName.sportsCell)
    }
}


// MARK: - Collection View Delegation and Data Source Methods
extension SportsVC : UICollectionViewDelegate , UICollectionViewDataSource {
    
    // Number of items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportsList.count
    }
    
    // Cell of item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = sportsCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifierName.sportsCell, for: indexPath) as? SportCell else {return UICollectionViewCell()}
        
        cell.sportTitleLabel.text = sportsList[indexPath.row].strSport
        let url = URL(string: sportsList[indexPath.row].strSportThumb)
        cell.sportIconeImagwView.kf.indicatorType = .activity
        cell.sportIconeImagwView.kf.setImage(with: url , placeholder: UIImage(named: imagePlaceholder.placeholder))
        return cell
    }
    
    // Did Seletct item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard : UIStoryboard = UIStoryboard(name: Storyboards.main, bundle: nil)
        let leaguesVC = storyboard.instantiateViewController(withIdentifier: VCs.LeagueVC) as! LeaguesVC
        leaguesVC.selectedSport = sportsList[indexPath.row].strSport
        self.navigationController?.pushViewController(leaguesVC, animated: true)
    }
} 


// MARK: - Collection View Flow Layout Methods
extension SportsVC : UICollectionViewDelegateFlowLayout {
    
    // Number of items per Row
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = UIScreen.main.bounds.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: 200)
    }
}

// MARK: - Load Data Methods
extension SportsVC {
    // Get Sports Function
    func getAllSports() {
        sportsViewModel = SportsViewModel()
        sportsViewModel?.BindingParsingclouser = { [weak self] in
            DispatchQueue.main.async {
                self?.sportsList = self?.sportsViewModel?.sportsList ?? []
                self?.sportsCollectionView.reloadData()
            }
        }
        sportsViewModel?.getAllSports()
    }
}


