//
//  FavLeagueCell.swift
//  The Sports App
//
//  Created by Mohamed Azooz on 15/06/2022.
//

import UIKit

class FavLeagueCell: UITableViewCell {
    
    // outlets 
    @IBOutlet weak var leagueImageView: UIImageView!
    @IBOutlet weak var leagueNameLabel: UILabel!
    @IBOutlet weak var youtubeBtn: UIButton!
    @IBOutlet weak var favLeagueView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        favLeagueView.layer.cornerRadius = 20
        youtubeBtn.setTitle("", for: .normal)
        
        // For Circuler Image
        leagueImageView.layer.borderWidth = 1
        leagueImageView.layer.masksToBounds = false
        leagueImageView.layer.borderColor = UIColor.black.cgColor
        leagueImageView.layer.cornerRadius = leagueImageView.frame.height/2
        leagueImageView.clipsToBounds = true
        
        
        // Btn Corner Reduies
        youtubeBtn.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  
// MARK: - Favorite Table View Cell Layout Configrations
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
}
