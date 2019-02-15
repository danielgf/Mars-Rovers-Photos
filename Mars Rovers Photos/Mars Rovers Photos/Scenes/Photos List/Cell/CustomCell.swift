//
//  CustomCell.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit
import SDWebImage

class CustomCell: UICollectionViewCell {

    var viewModel: PhotosViewModel? { didSet { updateInfo() } }
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    fileprivate func updateInfo() {
        photoImageView.sd_setImage(with: URL(string: viewModel?.imgSrc ?? ""), placeholderImage: UIImage(named: ""), options: .refreshCached, completed: nil)
    }

}
