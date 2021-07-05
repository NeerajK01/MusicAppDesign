//
//  ItemsCollectionViewCell.swift
//  NeerajKumar
//
//  Created by Neeraj kumar on 04/07/21.
//

import UIKit

class ItemsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemsImageView: UIImageView!
    
    func setValue(imageLink: String){
        
        self.itemsImageView.layer.masksToBounds = true
        self.itemsImageView.layer.cornerRadius = self.itemsImageView.frame.height * 0.05
        
        let url = URL(string: imageLink)!
        downloadImage(from: url)
        
    }
    
    func downloadImage(from url: URL) {
        print("Download Started")
        ServiceRequest.shared.getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                self?.itemsImageView.image = UIImage(data: data)
            }
        }
    }
    
}
