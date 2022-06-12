//
//  SearchView.swift
//  NetflixClone
//
//  Created by Brian Coleman on 2022-06-12.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var vm: SearchVM = SearchVM()
    
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                SearchBar(text: $searchText, isLoading: $vm.isLoading)
                    .padding()
                
                Spacer()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
