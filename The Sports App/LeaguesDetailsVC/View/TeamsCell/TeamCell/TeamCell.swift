//
//  TeamCell.swift
//  The Sports App
//
//  Created by Mohamed Azooz on 07/06/2022.
//

import UIKit

class TeamCell: UICollectionViewCell {

    @IBOutlet weak var teamImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // For Circuler Image
        teamImageView.layer.backgroundColor = UIColor.black.cgColor
        teamImageView.layer.masksToBounds = false
        teamImageView.layer.cornerRadius = teamImageView.frame.height/2
        teamImageView.clipsToBounds = true
    }
    
    
}
