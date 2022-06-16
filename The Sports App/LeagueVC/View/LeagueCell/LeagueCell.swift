//
//  LeagueCell.swift
//  The Sports App
//
//  Created by Mohamed Azooz on 06/06/2022.
//

import UIKit

class LeagueCell: UITableViewCell {
    
    // OutLets
    @IBOutlet weak var leagueBadgeImage: UIImageView!
    @IBOutlet weak var leagueNameLabel: UILabel!
    @IBOutlet weak var youtubeBtn: UIButton!
    @IBOutlet weak var leagueCellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        youtubeBtn.setTitle("", for: .normal)
        leagueCellView.layer.cornerRadius = 20
        
        // For Circuler Image
        leagueBadgeImage.layer.borderWidth = 1
        leagueBadgeImage.layer.masksToBounds = false
        leagueBadgeImage.layer.borderColor = UIColor.black.cgColor
        leagueBadgeImage.layer.cornerRadius = leagueBadgeImage.frame.height/2
        leagueBadgeImage.clipsToBounds = true
        
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
