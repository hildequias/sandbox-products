//
//  ImageViewCell.swift
//  sandbox-products
//
//  Created by Hildequias Silas dos Santos Junior on 11/11/20.
//

import UIKit

class ImageViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var image: UIImageView!
    
    // MARK: - Properies
    static let cellIdentifier = "imageCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Methods
    func setup(url: String) {
        debugPrint(url)
        image.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder"))
    }

}
