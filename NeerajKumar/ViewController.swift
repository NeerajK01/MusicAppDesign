//
//  ViewController.swift
//  NeerajKumar
//
//  Created by Neeraj kumar on 04/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    
    var dataVM: DataVM = DataVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        
        // Do any additional setup after loading the view.
        ServiceResponse.shared.getResponse(apiKey: ConstantData.shared.API_KEY, completion: {
            (response, error) in
            if error == nil{
                if let data = response{
                    self.dataVM = data as! DataVM
                    DispatchQueue.main.async {
                        self.mainTableView.reloadData()
                    }
                }
            }
        })
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataVM.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "parallexEffectCell", for: indexPath) as! ParallexEffectCell
            if let banner = self.dataVM.data?[indexPath.section].topBanners{
                cell.setValue(banner: banner)
            }
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "genresCell", for: indexPath) as! GenresCell
            if let genres = self.dataVM.data?[indexPath.section].genres{
                cell.setValues(genres: genres)
            }
            return cell
        }else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "bannerCell", for: indexPath) as! BannerCell
            if let banners = self.dataVM.data?[indexPath.section].banners{
                cell.setValues(banner: banners)
            }
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "itemsCell", for: indexPath) as! ItemsCell
            if let items = self.dataVM.data?[indexPath.section].items{
                cell.setValues(items: items)
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return (self.dataVM.data?.count != 0 && section > 2) ? self.tabldeHeaderView(title: self.dataVM.data?[section].title ?? "", width: Double(self.view.frame.size.width), height: section > 2 ? 40 : 0, forSection: section) : nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section > 2 ? 40 : 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 350
        }else if indexPath.section == 1{
            return 150
        }
        if indexPath.section == 2{
            return 220
        }else{
            return 250
        }
    }
    
    
    func tabldeHeaderView(title: String, width: Double, height: Double, forSection: Int) -> UIView{
        let view = UIView()
        view.frame = CGRect.init(x: 0, y: 0, width: width, height: height)
        let label = UILabel()
        label.frame = CGRect.init(x: 14, y: 14, width: view.frame.size.width, height: 18)
        label.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "  \(title)>"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Ubuntu", size: 14)
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
        
        let verticalConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)
        
        let widthConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
        
        let heightConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
        
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        view.backgroundColor = UIColor.clear
        
        return view
    }
}
