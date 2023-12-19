//
//  ContentView.swift
//  swiftui-demo
//
//  Created by Anya on 11/15/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            NavigationStack {
                VStack(){
                    Text("Melo.")
                        .font(.largeTitle)
                        .bold()
                        .monospaced()
                        .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
                    Text("Your personal music diary.")
                        .font(.subheadline)
                        .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
                        .padding(.bottom, 30)
                    HStack{
                        Image(systemName: "music.note")
                            .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
                        Image(systemName: "note")
                            .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
                        Image(systemName: "music.mic")
                            .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
                        Image(systemName: "pin")
                            .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
                        Image(systemName: "radio.fill")
                            .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
                        Image(systemName: "music.quarternote.3")
                            .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
                        Image(systemName: "quote.bubble")
                            .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
                        
                    }
                    .padding(.bottom, 50)
                    //profileView
                    NavigationLink{
                        AlbumListView()
                    }label:{
                        viewAlbumsButton
                    }
                    NavigationLink{
                        AddAlbumView(albumName: "" , artistName: "", year: "", image: "default", genre: "", selectedRating: "0" )
                    } label: {
                        addAlbumButton
                    }
                    
        
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red:0.84705882352, green: 0.74901960784, blue:0.84705882352))
            }
        
       }
   // }
    
//    private var profileView: some View {
//        VStack{
//            //Form{
//            Image("profile")
//                .resizable()
//                .frame(width: 200, height: 200)
//                .padding(.bottom)
//                Group{
//                    Text("Kamisato Ayaka")
//                        .bold()
//                        .font(.title)
//                    Text("Kyoto, Japan")
//                    
//                }.font(.title2)
//           // }
//        }
//    }
    
    private var viewAlbumsButton: some View {
        Text("My List")
            .foregroundStyle(Color(red:0.84705882352, green: 0.74901960784, blue:0.84705882352))
            .padding(EdgeInsets(top:10,leading:20, bottom:10, trailing: 20 ))
            .background(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
    private var addAlbumButton : some View {
        Text("Add Album")
            .foregroundStyle(Color(red:0.84705882352, green: 0.74901960784, blue:0.84705882352))
            .padding(EdgeInsets(top:10,leading:20, bottom:10, trailing: 20 ))
            .background(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
            .clipShape(RoundedRectangle(cornerRadius: 15))
    
    }
}

extension Color {
    func toHex() -> String? {
        let uic = UIColor(self)
        guard let components = uic.cgColor.components, components.count >= 3 else {
            return nil
        }
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)
        
        if components.count >= 4 {
            a = Float(components[3])
        }
        
        if a != Float(1.0) {
            return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
        } else {
            return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
        }
    }
}
    

#Preview {
    ContentView()
}


