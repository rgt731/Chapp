//
//  AnnouncementTableViewCell.swift
//  Chapp
//
//  Created by Robert Thompson on 11/16/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import UIKit

class AnnouncementTableViewCell: UITableViewCell {
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var AnnouncementTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
