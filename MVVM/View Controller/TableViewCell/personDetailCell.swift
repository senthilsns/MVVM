//
//  personDetailCell.swift
//  MVVM
//
//  Created by SENTHIL on 16/10/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import UIKit

class personDetailCell: UITableViewCell {

    @IBOutlet var personNameLabel: UILabel!
    @IBOutlet var companyNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
