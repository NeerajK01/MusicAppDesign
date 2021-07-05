//
//  GenresCell.swift
//  NeerajKumar
//
//  Created by Neeraj kumar on 04/07/21.
//

import UIKit

class GenresCell: UITableViewCell {
    
    
    @IBOutlet weak var genresCollectionView: UICollectionView!
    var genresData: [GenresVM] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.genresCollectionView.dataSource = self
        self.genresCollectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

    func setValues(genres: [GenresVM]){
        if genres.count != 0{
            self.genresData = genres
            self.genresCollectionView.reloadData()
        }
    }
    
}

extension GenresCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.genresData.count != 0 ? self.genresData.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genresCVCell", for: indexPath) as! GenresCollectionViewCell
        if let imageLink = self.genresData[indexPath.row].image, let title = self.genresData[indexPath.row].title{
            cell.setValue(imageLink: imageLink, title: title)
        }
        return cell
    }
    
}

extension GenresCell : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemsPerRow:CGFloat = 4
        let hardCodedPadding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        return CGSize(width: itemWidth, height: itemHeight)
        
    }
    
}
