//
//  HomeView.swift
//  ClassixUI
//
//  Created by Brian Coleman on 2022-06-09.
//

import SwiftUI

struct HomeView: View {
    var vm: HomeVM = HomeVM()
    
    let screen = UIScreen.main.bounds

    @State private var movieDetailToShow: Movie? = nil
    
    @State private var topRowSelection: HomeTopRow = .tvShows
    @State private var homeGenre: HomeGenre = .AllGenres
    
    @State private var showTopRowSelection = false
    @State private var showGenreSelection = false
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    
                    TopRowButtons(topRowSelection: $topRowSelection, homeGenre: $homeGenre, showTopRowSelection: $showTopRowSelection, showGenreSelection: $showGenreSelection)
                    
                    TopMoviePreview(movie: exampleMovie1)
                        .frame(width: screen.width)
                        .padding(.top, -110)
                        .zIndex(-1)
                    
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
                                    ForEach(vm.getMovie(forCat: category)) { movie in
                                        StandardHomeMovie(movie: movie)
                                            .frame(width: 100, height: 200)
                                            .padding(.horizontal, 20)
                                            .onTapGesture {
                                                movieDetailToShow = movie
                                            }
                                    }
                                }
                            }
                        }
                        
                    }
                }
            }
            
            if let movie = movieDetailToShow {
                MovieDetail(movie: movie, movieDetailToShow: $movieDetailToShow)
                    .animation(.easeIn)
                    .transition(.opacity)
            }
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TopRowButtons: View {
    
    @Binding var topRowSelection: HomeTopRow
    @Binding var homeGenre: HomeGenre
    
    @Binding var showTopRowSelection: Bool
    @Binding var showGenreSelection: Bool
    
    var body: some View {
        switch topRowSelection {
        case .home:
            HStack {
                Button {
                    topRowSelection = .home
                } label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                }
                .buttonStyle(.plain)
                
                Spacer()
                
                Button {
                    topRowSelection = .tvShows
                } label: {
                    Text("TV Shows")
                }
                .buttonStyle(.plain)
                
                Spacer()
                
                Button {
                    topRowSelection = .movies
                } label: {
                    Text("Movies")
                }
                .buttonStyle(.plain)
                
                Spacer()
                
                Button {
                    topRowSelection = .myList
                } label: {
                    Text("My List")
                }
                .buttonStyle(.plain)
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
        case .tvShows, .movies, .myList:
            HStack {
                Button {
                    topRowSelection = .home
                } label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                }
                .buttonStyle(.plain)
                
                HStack(spacing: 20) {
                    Button {
                        showTopRowSelection = true
                    } label: {
                        HStack {
                            Text(topRowSelection.rawValue)
                                .font(.system(size: 18))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 10))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    }
                    .buttonStyle(.plain)
                    
                                    
                    Button {
                        showGenreSelection = true
                    } label: {
                        HStack {
                            Text(homeGenre.rawValue)
                                .font(.system(size: 12))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 6))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    }
                    .buttonStyle(.plain)
                    
                    Spacer()
                }
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
        }
    }
}

enum HomeTopRow: String, CaseIterable {
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
}

enum HomeGenre: String {
    case AllGenres = "All Genres"
    case Action
    case Comedy
    case Horror
    case Thriller
}
