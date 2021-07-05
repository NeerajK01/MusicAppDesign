//
//  BannerCell.swift
//  NeerajKumar
//
//  Created by Neeraj kumar on 04/07/21.
//

import UIKit

class BannerCell: UITableViewCell {

    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    var bannerData: [BannerVM] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.bannerCollectionView.delegate = self
        self.bannerCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setValues(banner: [BannerVM]){
        if banner.count != 0{
            self.bannerData = banner
            self.bannerCollectionView.reloadData()
        }
    }

}

extension BannerCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.bannerData.count != 0 ? self.bannerData.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCVCell", for: indexPath) as! BannerCollectionViewCell
        if let imageLink = self.bannerData[indexPath.row].image{
            cell.setValue(imageLink: imageLink)
        }
        return cell
    }
    
}

extension BannerCell : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemsPerRow:CGFloat = 1
        let hardCodedPadding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        return CGSize(width: itemWidth, height: itemHeight)
        
    }
    
}
