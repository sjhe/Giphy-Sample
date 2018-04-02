//
//  TableViewCellViewController.swift
//  Giphy-Sample
//
//  Created by John He on 2018-04-01.
//  Copyright © 2018 sjhe. All rights reserved.
//

import UIKit
import GiphyCoreSDK

protocol GiphyTableViewDelegate {
    func didTapSaveButton(url: String)
    func didTapUnSaveButton(url: String)
}

class TableViewCellViewController: UITableViewCell {

    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var imagePlaceHolder: UIImageView!
    
    var giphyMedia = GPHMedia()
    var delegate: GiphyTableViewDelegate?
//    var onButtonTapped: (() -> Void)? = nil
    
    
    func setMedia(media: GPHMedia) {
        giphyMedia = media
        imagePlaceHolder.image = UIImage.gif(url: giphyMedia.images!.fixedHeight!.gifUrl!)
        favouriteButton.setTitle("Save", for:.normal)
    }
    
    @IBAction func favouriteButtonTapped(_ sender: UIButton) {
        delegate?.didTapSaveButton(url: giphyMedia.images!.fixedHeight!.gifUrl!)
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
