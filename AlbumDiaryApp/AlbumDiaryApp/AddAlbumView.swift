//
//  AddAlbumView.swift
//  swiftui-demo
//
//  Created by Anya on 11/16/23.
//

import SwiftUI
import PhotosUI

struct AddAlbumView  : View {
    @State var albumName : String
    @State var artistName : String
    @State var year : String
    @State var image : String
    @State var genre : String
    
    @State var selectedRating : String
    let ratings = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    @State private var action: Int? = 0
    
    @State var selectedPhotos : [PhotosPickerItem] = [] // on state change save the image and display photo view and save to image state variable (for when it is submitted)
    @State var imageData: Data?
    
    
    var body : some View {
        VStack {
            
        }
        NavigationStack{
            // Ghost navigation link that depnds on state of action
            // Deprecated syntax
            
            NavigationLink(destination: AlbumListView(), tag: 1, selection: $action) {
                EmptyView()
            }
            
            VStack{
                    Form{
                        Section{
                            uploadImageButton
                                .listRowSeparator(.hidden)
                            if let data = imageData, let uiimage = UIImage(data: data){
                                Image(uiImage: uiimage)
                                    .resizable()
                                    .frame(width:300, height:300, alignment: .center)
                                    .padding(.leading, 7)
                                    .padding(.bottom)
                                    .listRowSeparator(.hidden)
                                
                            } else {
                                Image("")
                                    .resizable()
                                    .frame(width:300, height:300, alignment: .center)
                                    .padding(.leading, 7)
                                    .padding(.bottom)
                                    .listRowSeparator(.hidden)
                            }
                        }
                        Section(header: Text("Album Information")){
                            TextField("Album Name",text: $albumName )
                            TextField("Artist Name", text: $artistName)
                            TextField("Year Released",text: $year )
                            TextField("Genre",text: $genre )
                            
                        }.navigationTitle("Album Info")
                        
                        Picker("Rating", selection: $selectedRating) {
                                        ForEach(ratings, id: \.self) {
                                            Text($0)
                                                .foregroundStyle(.gray)
                                        }
                                    }
                                    .pickerStyle(.menu)
                        
                        
                        Section{
                            submitButton
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
            }
            .navigationTitle("Add an Album")
        }
    }
    

    var submitButton: some View {
        Button {
            if let data = imageData {
                // Concering forced unwrapping of optional val
                
                if let image = UIImage(data: data) {
                    let newAlbum = Album(artist: artistName, albumName: albumName, year: year, genre: genre, image: image, rating: selectedRating)
                    albums.append(newAlbum)
                    action = 1
                }
                
            } else {
                let newAlbum = Album(artist: artistName, albumName: albumName, year: year, genre: genre, image: UIImage(named:"DefaultAlbum")!, rating: selectedRating)
                albums.append(newAlbum)
                action = 1
            }
            
        } label : {
            Text("Submit")
        }
    }
    
    var uploadImageButton : some View {
        PhotosPicker(
            selection: $selectedPhotos,
            maxSelectionCount: 1,
            matching: .images
        ){
            Text("+ Edit Album Cover ")
        }.onChange(of: selectedPhotos){ _ in
            guard let photo = selectedPhotos.first else {
                return
            }
            photo.loadTransferable(type: Data.self) { result in
                switch result {
                case .success(let data):
                    if let data = data {
                        self.imageData = data
                    } else {
                        print("Data is nil")
                    }
                case .failure(let failure):
                    fatalError("\(failure)")
                }
            }
        }
    }
    
    
    
}


#Preview {
    AddAlbumView(albumName: "", artistName: "", year: "", image: "", genre:"", selectedRating: "")
}

