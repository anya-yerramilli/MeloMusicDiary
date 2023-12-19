//
//  SongListView.swift
//  AlbumDiaryApp
//
//  Created by Anya Yerramilli on 12/18/23.
//

import Foundation

import SwiftUI

struct SongListView : View {
    
    //var chosenAlbum : Album
    
    var body: some View {
        VStack{

            HStack {
                Text("Albums")
                .padding(10)
                .bold()
                .background(Color(red:0.94705882352, green: 0.84901960784, blue:0.94705882352))
                .foregroundColor(Color(red:0.84705882352, green: 0.74901960784, blue:0.84705882352))
                .cornerRadius(0)
//                .cornerRadius(10)
                
                Text("Songs")
                    .bold()
                    .padding(10)
                    .background(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
                    .foregroundColor(Color(red:0.84705882352, green: 0.74901960784, blue:0.84705882352))
                    .cornerRadius(0)
            }.padding(.bottom)
            
            
            VStack{
                HStack {
                    Text("Songs List")
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
                    Text("Your favorite songs...")
                        .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
                        .font(.subheadline)
                        .padding(.leading, 30)
                    Spacer()
                }
            }
            List(songs, id: \.self)
            {
                song in
                NavigationLink {
                    //FavAlbumView(albumPick: song, notes: "")
                    ContentView()
                } label: {
                    songInfoRow(song: song)
                }.listRowBackground(Color(red:0.94705882352, green: 0.84901960784, blue:0.94705882352))
            }
            .background(Color(red:0.84705882352, green: 0.74901960784, blue:0.84705882352))
            .scrollContentBackground(.hidden)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red:0.84705882352, green: 0.74901960784, blue:0.84705882352))

    }
    
    private func songInfoRow(song:Song) -> some View {
        HStack{
        
            VStack(alignment:.leading){
                Text(song.songName)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
                Text(song.artist)
                    .fontWeight(.medium)
                    .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
                
                Text("(\(String(song.year)))")
                    .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
            }
        }
        
    }
}

#Preview {
    SongListView()
}

