//
//  DataJsonModel.swift
//  NeerajKumar
//
//  Created by Neeraj kumar on 04/07/21.
//

import Foundation

struct DataJsonModel: Codable {
    var success: Bool?
    var data: [DataModel]?
    init(success: Bool?, data: [DataModel]?) {
        self.success = success
        self.data = data
    }
}

struct DataModel: Codable{
    var title: String?
    var items: [ItemModel]?
    var banners: [[BannerModel]]?
    var genres: [GenresModel]?
    var slug: String?
    var categoryId: String?
    var collectionId: Int?
    var continueWatching: String?
    var topBanners: TopBannerModel?
    
    private enum CodingKeys: String, CodingKey{
        case continueWatching = "continue_watching"
        case collectionId = "collection_id"
        case categoryId = "category_id"
        case title, items, banners, genres, slug
        case topBanners = "top_banner"
    }
    
    init(categoryId: String?, collectionId: Int?, continueWatching: String?, topBanners: TopBannerModel?, title: String?, items: [ItemModel]?, banners: [[BannerModel]]?, genres:  [GenresModel]?, slug: String?) {
        
        self.categoryId = categoryId
        self.collectionId = collectionId
        self.continueWatching = continueWatching
        self.topBanners = topBanners
        self.title = title
        self.items = items
        self.banners = banners
        self.genres = genres
        self.slug = slug
        
    }
}

struct ItemModel: Codable {
    var id: Int?
    var slug: String?
    var title: String?
    var description: String?
    var brightcoveTrailerId: String?
    var categorySlug: String?
    var verticalImage: String?
    var horizontalImage: String?
    var type: Int?
    
    private enum CodingKeys: String, CodingKey{
        case brightcoveTrailerId = "brightcove_trailer_id"
        case categorySlug = "category_slug"
        case verticalImage = "vertical_image"
        case horizontalImage = "horizontal_image"
        
        case id, slug, title, description, type
    }
    
    init(brightcoveTrailerId: String?, categorySlug: String?, verticalImage: String?, horizontalImage: String?, id: Int?, slug: String?, title: String?, description: String?, type: Int?) {
        self.brightcoveTrailerId = brightcoveTrailerId
        self.categorySlug = categorySlug
        self.verticalImage = verticalImage
        self.horizontalImage = horizontalImage
        self.id = id
        self.slug = slug
        self.title = title
        self.description = description
        self.type = type
    }
}

struct BannerModel: Codable {
    var id: Int?
    var bannerId: Int?
    var image: String?
    var imageOrder: Int?
    var url: String?
    
    private enum CodingKeys: String, CodingKey{
        case bannerId = "banner_id"
        case imageOrder = "image_order"
        case id, image, url
    }
    
    init(bannerId: Int?, imageOrder: Int?, id: Int?, image: String?, url: String?) {
        self.bannerId = bannerId
        self.imageOrder = imageOrder
        self.id = id
        self.image = image
        self.url = url
    }
}

struct GenresModel: Codable {
    var title: String?
    var image: String?
    var slug: String?
    
    private enum CodingKeys: String, CodingKey{
        case title, image, slug
    }
    
    init(title: String?, image: String?, slug: String?) {
        self.title = title
        self.image = image
        self.slug = slug
    }
}

struct TopBannerModel: Codable {
    var image: String?
    var slug: String?
    var trailerID: String?
    var id: Int?
    var video: String?
    var type: Int?
    
    private enum CodingKeys: String, CodingKey{
        case trailerID = "trailer_id"
        case image, slug, id, video, type
    }
    
    init(trailerID: String?, image: String?, slug: String?, id: Int?, video: String?, type: Int?) {
        self.trailerID = trailerID
        self.image = image
        self.slug = slug
        self.id = id
        self.video = video
        self.type = type
    }
}
