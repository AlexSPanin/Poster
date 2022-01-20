//
//  Poster.swift
//  Poster
//
//  Created by Александр Панин on 20.01.2022.
//

import Foundation

struct Posters: Decodable {
    let data: [Attributes]?
}

struct Attributes: Decodable {
    let attributes: Attribute?
}

struct Attribute: Decodable {
    let slug: String?
    let synopsis: String?
    let userCount: Int?
    let favoritesCount: Int?
    let posterImage: PosterImage?
    
    var title: String {
        """
Title: \(slug ?? "")
User Count: \(userCount ?? 0)
Favorite User: \(favoritesCount ?? 0)
"""
    }
}

struct PosterImage: Decodable {
    let tiny: String?
    let original: String?
}
