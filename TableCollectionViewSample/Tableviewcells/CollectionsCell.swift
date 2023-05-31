//
//  CollectionsCell.swift
//  TableCollectionViewSample
//
//  Created by Nick on 5/29/23.
//

import UIKit

class CollectionsCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cellmodel : TableViewCellModel? {
        didSet{
            collectionView.reloadData()
        }
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

extension CollectionsCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellmodel?.cellItems.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as? CollectionCellinTable else {
            return UICollectionViewCell()
        }
        cell.title.text = cellmodel?.cellItems[indexPath.row].title
        cell.backgroundColor = cellmodel?.cellItems[indexPath.row].backgroundColor
        return cell
    }
}

//設定collection view cell 的layout
extension CollectionsCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 100, height: collectionView.bounds.height - 10)
    }
}
