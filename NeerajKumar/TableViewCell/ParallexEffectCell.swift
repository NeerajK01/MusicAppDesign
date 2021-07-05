//
//  ParallexEffectCell.swift
//  NeerajKumar
//
//  Created by Neeraj kumar on 04/07/21.
//

import UIKit

class ParallexEffectCell: UITableViewCell {

    
    @IBOutlet weak var bannerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setValue(banner: TopBannerVM){
        if let imageLink = banner.image{
            let url = URL(string: imageLink)!
            downloadImage(from: url)
        }

    }

    func downloadImage(from url: URL) {
        ServiceRequest.shared.getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                self?.bannerImage.image = UIImage(data: data)
            }
        }
    }
    
    
}
