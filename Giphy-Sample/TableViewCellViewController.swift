//
//  TableViewCellViewController.swift
//  Giphy-Sample
//
//  Created by John He on 2018-04-01.
//  Copyright © 2018 sjhe. All rights reserved.
//

import UIKit

class TableViewCellViewController: UITableViewCell {

    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var imagePlaceHolder: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
