//
//  FavAlbumView.swift
//  swiftui-demo
//
//  Created by Anya on 11/15/23.
//

import SwiftUI

struct FavAlbumView  : View {
    var albumPick : Album // argument into this view
    
    var body : some View {
        ScrollView{
            Image(uiImage: albumPick.image)
                .resizable()
                .frame(width: 300, height: 300)
                .padding(.top)
                .padding(.bottom)
            Text(albumPick.albumName)
                .font(.title2)
                .bold()
            Text(albumPick.artist)
                .font(.title3)
            Text("(\(String(albumPick.year)))")
        }.background(Color(red:0.84705882352, green: 0.74901960784, blue:0.84705882352))
        .navigationTitle("Album Details")
    }
}

//#Preview {
//    FavAlbumView()
//}
