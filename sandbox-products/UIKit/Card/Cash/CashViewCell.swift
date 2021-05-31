//
//  CashViewCell.swift
//  sandbox-products
//
//  Created by Hildequias Silas dos Santos Junior on 11/11/20.
//

import UIKit

class CashViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var banner: UIImageView!
    
    // MARK: - Properies
    var cash: Cash?
    let cashText = "Cash"
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Methods
    func setup(_ cash: Cash) {
        self.cash = cash
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: cash.title);
        attributedString.setColorForString(textToFind: cashText, color: UIColor(named: .gray));
        title.attributedText = attributedString;
        banner.sd_setImage(with: URL(string: cash.bannerURL), placeholderImage: UIImage(named: "placeholder.png"))
        banner.roundCornersAndShadows()
    }
}
