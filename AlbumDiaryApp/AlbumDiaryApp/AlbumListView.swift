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
            Text("Your Album List")
                .font(.title)
                .bold()
                .monospaced()
                .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
            List(albums, id: \.self)
            {
                album in
                NavigationLink {
                    FavAlbumView(albumPick: album, notes: "")
                } label: {
                    albumInfoRow(album: album)
                }.listRowBackground(Color(red:0.94705882352, green: 0.84901960784, blue:0.94705882352))
            }
            .background(Color(red:0.84705882352, green: 0.74901960784, blue:0.84705882352))
            .scrollContentBackground(.hidden)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red:0.84705882352, green: 0.74901960784, blue:0.84705882352))

    }
    
    private func albumInfoRow(album:Album) -> some View {
        HStack{
            
            Image(uiImage: album.image)
                .resizable()
                .frame(width:100, height:100)
            
            
            VStack(alignment:.leading){
                Text(album.albumName)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
                Text(album.artist)
                    .fontWeight(.medium)
                    .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
                
                Text("(\(String(album.year)))")
                    .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
            }
        }
        
    }
}

