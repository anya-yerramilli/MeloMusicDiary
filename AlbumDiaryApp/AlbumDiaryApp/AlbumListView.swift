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

            HStack {
                Text("Albums")
                .padding(10)
                .bold()
                .background(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
                .foregroundColor(Color(red:0.84705882352, green: 0.74901960784, blue:0.84705882352))
                .cornerRadius(0)
//                .cornerRadius(10)
                
                Text("Songs")
                    .bold()
                    .padding(10)
                    .background(Color(red:0.94705882352, green: 0.84901960784, blue:0.94705882352))
                    .foregroundColor(Color(red:0.84705882352, green: 0.74901960784, blue:0.84705882352))
                    .cornerRadius(0)
            }.padding(.bottom)
            
            
            VStack{
                HStack {
                    Text("Album List")
                        .font(.title)
                        .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
                        .padding(.leading, 30)
                    Spacer()
                    NavigationLink{
                        AddAlbumView(albumName: "" , artistName: "", year: "", image: "default", genre: "", selectedRating: "0" )
                    } label: {
                        Text("+")
                    }
                    .padding(.trailing, 30)
                }
                HStack{
                    Text("Your favorite albums...")
                        .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
                        .font(.subheadline)
                        .padding(.leading, 30)
                    Spacer()
                }
            }
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

#Preview {
    AlbumListView()
}

