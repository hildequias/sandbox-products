//
//  SpotlightViewCell.swift
//  sandbox-products
//
//  Created by Hildequias Silas dos Santos Junior on 11/11/20.
//

import UIKit

class SpotlightViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properies
    var spotlights: [Spotlight]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Methods
    func setup(spotlights: [Spotlight]) {
        self.spotlights = spotlights
        registerTableViewCells()
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    private func registerTableViewCells() {
        let bannerCell = UINib(nibName: "BannerViewCell", bundle: nil)
        collectionView.register(bannerCell, forCellWithReuseIdentifier: BannerViewCell.cellIdentifier)
    }
}

// MARK: - Extension UICollectionViewDataSource
extension SpotlightViewCell : UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.spotlights?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerViewCell.cellIdentifier,
                                                      for: indexPath) as! BannerViewCell
        
        let spotlight = spotlights?[indexPath.item]
        cell.setup(url: spotlight?.bannerURL ?? "")
        cell.roundAndShadowsCard()
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

// MARK: - Extension UICollectionViewDelegateFlowLayout
extension SpotlightViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 330, height: 150)
    }
}
