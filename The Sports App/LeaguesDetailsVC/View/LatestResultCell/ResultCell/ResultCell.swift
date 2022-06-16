//
//  CollectionViewCell.swift
//  The Sports App
//
//  Created by Mohamed Azooz on 07/06/2022.
//

import UIKit

class ResultCell: UICollectionViewCell {
    // OutLets
    @IBOutlet weak var teamsNamesLabel: UILabel!
    @IBOutlet weak var teamsScoreLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var resultView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        resultView.layer.cornerRadius = 20
    }

}
