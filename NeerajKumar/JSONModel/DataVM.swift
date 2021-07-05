//
//  DataVM.swift
//  NeerajKumar
//
//  Created by Neeraj kumar on 05/07/21.
//

import Foundation

class DataVM {
    var success: Bool?
    var data: [DataModelVM]?
}

class DataModelVM {
    var title: String?
    var items: [ItemVM]?
    var banners: [BannerVM]?
    var genres: [GenresVM]?
    var slug: String?
    var categoryId: String?
    var collectionId: Int?
    var continueWatching: String?
    var topBanners: TopBannerVM?
}

class ItemVM {
    var id: Int?
    var slug: String?
    var title: String?
    var description: String?
    var brightcoveTrailerId: String?
    var categorySlug: String?
    var verticalImage: String?
    var horizontalImage: String?
    var type: Int?
}

class BannerVM {
    var id: Int?
    var bannerId: Int?
    var image: String?
    var imageOrder: Int?
    var url: String?
}

class GenresVM {
    var title: String?
    var image: String?
    var slug: String?
}

class TopBannerVM{
    var image: String?
    var slug: String?
    var trailerID: String?
    var id: Int?
    var video: String?
    var type: Int?
}
