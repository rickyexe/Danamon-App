//
//  Photo.swift
//  Danamon-App
//
//  Created by Ricky Gideon Iskandar Daun on 15/02/22.
//

import Foundation



// MARK: - PhotoElement
struct PhotoElement: Codable {
    let albumId : Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String

    enum CodingKeys: String, CodingKey {
        case albumId
        case thumbnailUrl
        case id, title, url
    }
}

typealias Photo = [PhotoElement]
