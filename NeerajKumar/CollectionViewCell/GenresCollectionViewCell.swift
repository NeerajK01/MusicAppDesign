//
//  GenresCollectionViewCell.swift
//  NeerajKumar
//
//  Created by Neeraj kumar on 04/07/21.
//

import UIKit

class GenresCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var genresImageView: UIImageView!
    @IBOutlet weak var genresTitle: UILabel!
    
    
    func setValue(imageLink: String, title: String){

        self.genresImageView.layer.masksToBounds = true
        self.genresImageView.layer.cornerRadius = self.genresImageView.frame.height * 0.05

        self.genresTitle.text = "\(title)"
        self.genresTitle.layer.shadowColor = UIColor.black.cgColor
        self.genresTitle.layer.shadowRadius = 3.0
        self.genresTitle.layer.shadowOpacity = 1.0
        
        let url = URL(string: imageLink)!
        downloadImage(from: url)

    }

    func downloadImage(from url: URL) {
        ServiceRequest.shared.getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                self?.genresImageView.image = UIImage(data: data)
            }
        }
    }
    
}
