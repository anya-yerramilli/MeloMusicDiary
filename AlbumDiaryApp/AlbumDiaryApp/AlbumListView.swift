//
//  AlbumListView.swift
//  swiftui-demo
//
//  Created by Anya on 11/15/23.
//

import SwiftUI

struct AlbumListView : View {
    
    //var chosenAlbum : Album
    
    var body: some View {
        VStack{
            List(albums, id: \.self)
            {
                album in
                NavigationLink {
                    FavAlbumView(albumPick: album)
                } label: {
                    albumInfoRow(album: album)
                }
            }.navigationTitle("Your Favorite Albums")
        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color(red:0.84705882352, green: 0.74901960784, blue:0.84705882352))
    }
    
    private func albumInfoRow(album:Album) -> some View {
        HStack{
            
            Image(uiImage: album.image)
                .resizable()
                .frame(width:100, height:100)
            
            
            VStack(alignment:.leading){
                Text(album.artist)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(album.albumName)
                    .fontWeight(.medium)
                    .italic()
                
                Text("(\(String(album.year)))")
            }
        }
        
    }
}

