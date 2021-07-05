//
//  ItemsCell.swift
//  NeerajKumar
//
//  Created by Neeraj kumar on 04/07/21.
//

import UIKit

class ItemsCell: UITableViewCell {

    @IBOutlet weak var itemsCollectionView: UICollectionView!
    var itemsData: [ItemVM] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.itemsCollectionView.delegate = self
        self.itemsCollectionView.dataSource = self
        
    }
    
    func setValues(items: [ItemVM]){
        if items.count != 0{
            self.itemsData = items
            self.itemsCollectionView.reloadData()
        }
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ItemsCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itemsData.count != 0 ? self.itemsData.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemsCVCell", for: indexPath) as! ItemsCollectionViewCell
        if let imageLink = self.itemsData[indexPath.row].verticalImage{
            cell.setValue(imageLink: imageLink)
        }
        return cell
    }
    
}

extension ItemsCell : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemsPerRow:CGFloat = 4
        let hardCodedPadding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        return CGSize(width: itemWidth, height: itemHeight)
        
    }
    
}
