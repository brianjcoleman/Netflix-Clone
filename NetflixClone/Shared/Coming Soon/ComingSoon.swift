//
//  ComingSoon.swift
//  NetflixClone
//
//  Created by Brian Coleman on 2022-06-12.
//

import SwiftUI

struct ComingSoon: View {
    @State private var showNotificationList = false
    
    @State private var navBarHidden = true
    
    var body: some View {
//        NavigationView {
            Group {
                ZStack {
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    
                    ScrollView {
                        VStack {
                            NotificationBar(showNotificationList: $showNotificationList)
                            
                            Text("For each loop of cells")
                        }
                    }
                    .foregroundColor(.white)
                }
            }
            
            NavigationLink(
                destination: Text("Notifications List"),
                isActive: $showNotificationList,
                label: {
                    EmptyView()
                })
                .navigationTitle("")
                .navigationBarHidden(navBarHidden)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in
                self.navBarHidden = true
                })
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
                self.navBarHidden = false
                })
//        }
    }
}

struct ComingSoon_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoon()
    }
}
