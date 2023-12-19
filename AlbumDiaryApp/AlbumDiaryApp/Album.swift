//
//  Album.swift
//  AlbumDiaryApp
//
//  Created by Anya on 11/22/23.
//
import SwiftUI


struct Album : Hashable{
    let artist: String
    let albumName: String
    let year : String
    let genre : String
    let image : UIImage
    let rating : String
}
var albums : [Album] = [
    Album(artist:"Troye Sivan", albumName: "Bloom", year: "2018",  genre: "Indie Pop", image: UIImage(named: "Bloom")!, rating: "8")
]
