//
//  MoreLikeThis.swift
//  ClassixUI
//
//  Created by Brian Coleman on 2022-06-11.
//

import SwiftUI

struct MoreLikeThis: View {
    
    var movies: [Movie]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                
                ForEach(0..<movies.count) { index in
                    StandardHomeMovie(movie: movies[index])
                }
                
            }
        }
    }
}

struct MoreLikeThis_Previews: PreviewProvider {
    static var previews: some View {
        MoreLikeThis(movies: exampleMovies)
    }
}
