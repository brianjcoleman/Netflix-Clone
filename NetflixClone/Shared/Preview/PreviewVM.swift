//
//  PreviewVM.swift
//  NetflixClone
//
//  Created by Brian Coleman on 2022-06-12.
//

import Foundation

class PreviewVM: ObservableObject {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    
}
