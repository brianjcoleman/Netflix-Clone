//
//  SearchResultsGrid.swift
//  NetflixClone
//
//  Created by Brian Coleman on 2022-06-12.
//

import SwiftUI

struct SearchResultsGrid: View {
    var movies: [Movie]
    
    @Binding var movieDetailToShow: Movie?
    
    let screen = UIScreen.main.bounds
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(movies, id: \.id) { movie in
                StandardHomeMovie(movie: movie)
                    .frame(width: screen.width / 3 - 10, height: 160)
                    .clipped()
                    .onTapGesture {
                        movieDetailToShow = movie
                    }
            }
        }
    }
}

struct SearchResultsGrid_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsGrid(movies: generateMovies(20), movieDetailToShow: .constant(nil))
    }
}
