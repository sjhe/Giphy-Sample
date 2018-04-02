//
//  TableViewCellViewController.swift
//  Giphy-Sample
//
//  Created by John He on 2018-04-01.
//  Copyright © 2018 sjhe. All rights reserved.
//

import UIKit
import GiphyCoreSDK


class SecondViewTableViewCellVC: UITableViewCell {
    
    @IBOutlet weak var unsaveButton: UIButton!

    @IBOutlet weak var giphyPlaceHolder: UIImageView!
    
    var gifUrl: String = ""
    
    func setUrl(url: String) {
        gifUrl = url
        giphyPlaceHolder.image = UIImage.gif(url: gifUrl)
        unsaveButton.setTitle("Delete", for:.normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
