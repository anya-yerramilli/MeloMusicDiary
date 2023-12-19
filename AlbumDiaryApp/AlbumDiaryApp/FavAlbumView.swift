//
//  FavAlbumView.swift
//  swiftui-demo
//
//  Created by Anya on 11/15/23.
//

import SwiftUI

struct FavAlbumView  : View {
    var albumPick : Album 
    @State var notes : String
    
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
                .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
            Text(albumPick.artist)
                .font(.title3)
                .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
            Text("(\(String(albumPick.year)))")
                .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
            
            HStack{
                Text("Album Rating: ")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
                Text(albumPick.rating + " / 10")
                    .font(.title)
                    .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
            }
                .padding(.top)
            Text("Notes on this Album")
                .font(.title3)
                .bold()
                .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
                .padding(.top)
            ZStack{
                TextEditor(text:$notes)
                    .scrollContentBackground(.hidden)
                    .background(Color(red:0.94705882352, green: 0.84901960784, blue:0.94705882352))
                Text(notes).opacity(0).padding(.all, 8)
                
                    
            }
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
            .padding(.leading)
            .padding(.trailing)
            
//            
//            TextField("Album Notes", text: $notes, axis:.vertical)
//                .frame(width: 350, height: 350)
//                .background(Color(red:0.94705882352, green: 0.84901960784, blue:0.94705882352))
//                .clipShape(RoundedRectangle(cornerRadius: 15.0))
//                .padding(.leading)
//                .padding(.trailing)
            
            // ADD A SECTION FOR SPOTIFY STATS 
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red:0.84705882352, green: 0.74901960784, blue:0.84705882352))

    }
}

#Preview {
    FavAlbumView(albumPick: albums[0], notes: "")
}
