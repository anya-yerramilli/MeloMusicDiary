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

        NavigationStack{
            // Ghost navigation link that depnds on state of action
            // Deprecated syntax
            
            NavigationLink(destination: AlbumListView(), tag: 1, selection: $action) {
                EmptyView()
            }
            
            VStack{
                Text("Add Album Details")
                    .font(.title)
                    .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
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
                                Image("DefaultAlbum")
                                    .resizable()
                                    .frame(width:300, height:300, alignment: .center)
                                    .padding(.leading, 7)
                                    .padding(.bottom)
                                    .listRowSeparator(.hidden)
                            }
                        }
                        .listRowBackground(Color(red:0.94705882352, green: 0.84901960784, blue:0.94705882352))
                        
                        Section{
                            TextField("Album Name",text: $albumName )
                            TextField("Artist Name", text: $artistName)
                            TextField("Year Released",text: $year )
                            TextField("Genre",text: $genre )
                            
                        }.listRowBackground(Color(red:0.94705882352, green: 0.84901960784, blue:0.94705882352))
                        
                        Picker("Rating", selection: $selectedRating) {
                            ForEach(ratings, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.menu)
                        .listRowBackground(Color(red:0.94705882352, green: 0.84901960784, blue:0.94705882352))
                        
                        
                        Section{
                            submitButton
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .listRowBackground(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
                        .ignoresSafeArea()
                    }
                    .scrollContentBackground(.hidden)
            }
            .background(Color(red:0.84705882352, green: 0.74901960784, blue:0.84705882352))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red:0.84705882352, green: 0.74901960784, blue:0.84705882352))
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
                .foregroundStyle(Color(red:0.84705882352, green: 0.74901960784, blue:0.84705882352))
        }
    }
    
    var uploadImageButton : some View {
        PhotosPicker(
            selection: $selectedPhotos,
            maxSelectionCount: 1,
            matching: .images
        ){
            Image(systemName: "pencil")
                .foregroundStyle(Color(red: 0.09803921568, green: 0.09803921568, blue: 0.43921568627))
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
    AddAlbumView(albumName: "", artistName: "", year: "", image: "", genre:"", selectedRating: "0")
}

