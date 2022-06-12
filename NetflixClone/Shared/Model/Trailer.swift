//
//  Trailer.swift
//  NetflixClone
//
//  Created by Brian Coleman on 2022-06-11.
//

import Foundation

struct Trailer: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var videoURL: URL
    var thumbnailImageURL: URL
}
