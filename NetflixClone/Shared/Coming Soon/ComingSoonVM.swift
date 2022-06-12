//
//  ComingSoonVM.swift
//  NetflixClone
//
//  Created by Brian Coleman on 2022-06-12.
//

import Foundation

class ComingSoonVM: ObservableObject {
    @Published var movies: [Movie] = []
    
    init() {
        self.movies = generateMovies(20)
    }
    
    
}
