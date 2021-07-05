//
//  ConvertInToViewModel.swift
//  NeerajKumar
//
//  Created by Neeraj kumar on 05/07/21.
//

import Foundation

class ConvertInToViewModel {
    static let shared = ConvertInToViewModel()
    
    func convertIntoVM(model: DataJsonModel) -> DataVM{
        let dataVM: DataVM = DataVM()
        dataVM.success = model.success
        
        var dataModelVM: [DataModelVM] = [DataModelVM]()
        for data in model.data!{
            let dataObjVM = DataModelVM()
            
            dataObjVM.title = data.title ?? ""
            
            dataObjVM.slug = data.slug ?? ""
            dataObjVM.categoryId = data.categoryId ?? ""
            dataObjVM.collectionId = data.collectionId ?? 0
            dataObjVM.continueWatching = data.continueWatching ?? ""
            
            var itemVM: [ItemVM] = [ItemVM]()
            if let items = data.items{
                for itemData in items{
                    let itemObjVM = ItemVM()
                    
                    itemObjVM.id = itemData.id ?? 0
                    itemObjVM.slug = itemData.slug ?? ""
                    itemObjVM.title = itemData.title ?? ""
                    itemObjVM.description = itemData.description ?? ""
                    itemObjVM.brightcoveTrailerId = itemData.brightcoveTrailerId ?? ""
                    itemObjVM.categorySlug = itemData.categorySlug ?? ""
                    itemObjVM.verticalImage = itemData.verticalImage ?? ""
                    itemObjVM.horizontalImage = itemData.horizontalImage ?? ""
                    itemObjVM.type = itemData.type ?? 0
                    
                    itemVM.append(itemObjVM)
                    
                }
            }
            dataObjVM.items = itemVM
            
            var bannerVM: [BannerVM] = [BannerVM]()
            if let banners = data.banners {
                for bannerArr in banners {
                    for bannerData in bannerArr{
                        if let image = bannerData.image, image != nil && image != ""{
                            let bannerObjVM = BannerVM()
                            
                            bannerObjVM.id = bannerData.id ?? 0
                            bannerObjVM.bannerId = bannerData.bannerId ?? 0
                            bannerObjVM.image = image
                            bannerObjVM.imageOrder = bannerData.imageOrder ?? 0
                            bannerObjVM.url = bannerData.url ?? ""
                            
                            bannerVM.append(bannerObjVM)
                            
                        }
                    }
                }
            }
            dataObjVM.banners = bannerVM
            
            var genresVM: [GenresVM] = [GenresVM]()
            if let generes = data.genres{
                for genresData in generes{
                    let genresObjVM = GenresVM()
                    
                    genresObjVM.title = genresData.title ?? ""
                    genresObjVM.image = genresData.image ?? ""
                    genresObjVM.slug = genresData.slug ?? ""
                    
                    genresVM.append(genresObjVM)
                }
            }
            dataObjVM.genres = genresVM
            
            if let topBanner = data.topBanners{
                let topBannerVM: TopBannerVM = TopBannerVM()
                
                topBannerVM.image = topBanner.image ?? ""
                topBannerVM.slug = topBanner.slug ?? ""
                topBannerVM.trailerID = topBanner.trailerID ?? ""
                topBannerVM.id = topBanner.id ?? 0
                topBannerVM.video = topBanner.video ?? ""
                topBannerVM.type = topBanner.type ?? 0
                
                dataObjVM.topBanners = topBannerVM
            }
            dataModelVM.append(dataObjVM)
        }
        dataVM.data = dataModelVM
        return dataVM
    }
}
