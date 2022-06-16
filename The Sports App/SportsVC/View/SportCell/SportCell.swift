//
//  SportCell.swift
//  The Sports App
//
//  Created by Mohamed Azooz on 05/06/2022.
//

import UIKit

class SportCell: UICollectionViewCell {
    // OutLets 
    @IBOutlet weak var sportIconeImagwView: UIImageView!
    @IBOutlet weak var sportTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.sportIconeImagwView.layer.masksToBounds = true
        self.sportIconeImagwView.layer.cornerRadius = 20
    }

}
