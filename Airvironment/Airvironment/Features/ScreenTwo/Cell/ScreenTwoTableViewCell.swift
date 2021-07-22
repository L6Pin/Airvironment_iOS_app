//
//  ScreenTwoTableViewCell.swift
//  Airvironment
//
//  Created by Letnja Praksa 2 on 22.7.21..
//

import UIKit
import Kingfisher

class ScreenTwoTableViewCell: UITableViewCell {

    @IBOutlet weak var cellHum: UILabel!
    @IBOutlet weak var cellPoll: UILabel!
    @IBOutlet weak var cellTemp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(measurements: Air){
        cellHum.text = String( measurements.humidity!)
        cellPoll.text = String( measurements.pollution!)
        cellTemp.text = String( measurements.temperature!)

        
    }
    
}

extension UITableViewCell {
    static func reusableIdentifier() -> String {
        String(describing: Self.self)
    }
}
