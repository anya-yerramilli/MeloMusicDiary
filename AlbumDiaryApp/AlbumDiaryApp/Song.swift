//
//  Song.swift
//  AlbumDiaryApp
//
//  Created by Anya Yerramilli on 12/18/23.
//

import SwiftUI


struct Song : Hashable{
    let artist: String
    let songName: String
    let year : String
    let genre : String
    let rating : String
}
var songs : [Song] = [
    Song(artist:"Troye Sivan", songName: "Got Me Started", year: "2023",  genre: "Indie Pop", rating: "9")
]
