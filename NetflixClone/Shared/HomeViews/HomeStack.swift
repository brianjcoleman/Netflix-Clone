//
//  HomeStack.swift
//  NetflixClone
//
//  Created by Brian Coleman on 2022-06-12.
//

import SwiftUI

struct HomeStack: View {
    var vm: HomeVM
    
    var topRowSelection: HomeTopRow
    var selectedGenre: HomeGenre
    
    @Binding var movieDetailToShow: Movie?
    
    @Binding var showPreviewFullScreen: Bool
    @Binding var previewStartingIndex: Int
    
    var body: some View {
        ForEach(vm.allCategories, id: \.self) { category in
            VStack {
                HStack {
                    Text(category)
                        .font(.title3)
                        .bold()
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(vm.getMovie(forCat: category, andHomeRow: topRowSelection, andGenre: selectedGenre)) { movie in
                            StandardHomeMovie(movie: movie)
                                .frame(width: 135, height: 200)
                                .onTapGesture {
                                    movieDetailToShow = movie
                                }
                        }
                    }
                }
            }
            .padding(.leading, 6)
        }
    }
}

struct HomeStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false) {
                HomeStack(
                    vm: HomeVM(),
                    topRowSelection: .home,
                    selectedGenre: .AllGenres,
                    movieDetailToShow: .constant(nil),
                    showPreviewFullScreen: .constant(false),
                    previewStartingIndex: .constant(0)
                )
            }
            .foregroundColor(.white)
        }
    }
}
