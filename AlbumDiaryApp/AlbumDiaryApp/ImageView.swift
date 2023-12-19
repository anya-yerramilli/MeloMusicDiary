//
//  PhotoPickerView.swift
//  swiftui-demo
//
//  Created by Anya on 11/22/23.
//
//
//
import SwiftUI

struct PhotoPickerView: View {
   
    @Binding var showImagePicker: Bool
    @Binding var selectedImage: Image?

    var body: some View {
        ImagePicker(isShown: $showImagePicker, image: $selectedImage
            .onChange(of: selectedImage) { newImage in
                if let image = newImage {
                    self.selectedImage = image
                    self.showImagePicker = false // Dismiss the image picker after selecting an image
                }
            }
    }
}

struct PhotoCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCaptureView(showImagePicker: .constant(false), selectedImage: .constant(Image("")))
    }
}

