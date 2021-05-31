//
//  BannerViewCell.swift
//  sandbox-products
//
//  Created by Hildequias Silas dos Santos Junior on 11/11/20.
//

import UIKit
import SDWebImage

class BannerViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var image: UIImageView!
    
    // MARK: - Properies
    static let cellIdentifier = "bannerCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Methods
    func setup(url: String) {
        debugPrint(url)
        image.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder"))
        image.roundCornersAndShadows()
    }
}
