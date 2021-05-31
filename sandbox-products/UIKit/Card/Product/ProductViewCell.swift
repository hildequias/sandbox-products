//
//  ProductViewCell.swift
//  sandbox-products
//
//  Created by Hildequias Silas dos Santos Junior on 11/11/20.
//

import UIKit

class ProductViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properies
    var products: [Product]!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Methods
    func setup(_ products: [Product]) {
        self.products = products
        registerTableViewCells()
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    private func registerTableViewCells() {
        let imageCell = UINib(nibName: "ImageViewCell", bundle: nil)
        collectionView.register(imageCell, forCellWithReuseIdentifier: ImageViewCell.cellIdentifier)
    }
}

extension ProductViewCell : UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageViewCell.cellIdentifier, for: indexPath) as! ImageViewCell
        
        let product = products?[indexPath.item]
        cell.setup(url: product?.imageURL ?? "")
        cell.roundAndShadowsCard()
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension ProductViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
}
