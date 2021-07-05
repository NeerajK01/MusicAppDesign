//
//  BannerCollectionViewCell.swift
//  NeerajKumar
//
//  Created by Neeraj kumar on 04/07/21.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bannerImageView: UIImageView!
    
    func setValue(imageLink: String){
        
        self.bannerImageView.layer.masksToBounds = true
        self.bannerImageView.layer.cornerRadius = self.bannerImageView.frame.height * 0.05
        
        let url = URL(string: imageLink)!
        downloadImage(from: url)
        
    }
    
    func downloadImage(from url: URL) {
        ServiceRequest.shared.getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                self?.bannerImageView.image = UIImage(data: data)
            }
        }
    }
    
}
