//
//  EventsCell.swift
//  The Sports App
//
//  Created by Mohamed Azooz on 06/06/2022.
//

import UIKit

class EventsCell: UICollectionViewCell {

    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var eventsCellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.eventsCellView.layer.cornerRadius = 20
    }
}
