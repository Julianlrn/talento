//
//  ImagePicker.swift
//  talento
//
//  Created by Julian Preissing  on 25.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseUI



struct ImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode)
    var presentationMode

    @Binding var image: Image?
    @Binding var imageUrl: String?

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

        @Binding var presentationMode: PresentationMode
        @Binding var image: Image?
        @Binding var imageUrl: String?

        init(presentationMode: Binding<PresentationMode>, image: Binding<Image?>, imageUrl: Binding<String?>) {
            _presentationMode = presentationMode
            _image = image
            _imageUrl = imageUrl
        }

        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
//            func randomString(length: Int) -> String {
//              let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
//              return String((0..<length).map{ _ in letters.randomElement()! })
//            }

            
            let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            let imgID = UUID().uuidString
            
                // randomString(length: 10)
            
            
            image = Image(uiImage: uiImage)
            let storage = Storage.storage()
            let imgRef = storage.reference().child("Images/" + imgID + ".jpeg")
            storage.reference().child("Images/" + imgID + ".jpeg").putData(uiImage.jpegData(compressionQuality: 0.35)!, metadata:
                nil) { (_, err) in
                    
                if err != nil{
                    print((err?.localizedDescription)!)
                    return
                }
                    imgRef.downloadURL{
                        (url, error) in
                        guard let url = url else {
                            print("Im error case...")
                            return
                        }
                    
                        self.imageUrl = url.absoluteString
                        // print(url!)
                        print("im success modus..." + self.imageUrl!)
                        
                    }
                print("upload of image " + imgID +  " successfull")
                
                    self.presentationMode.dismiss()
                // return
            }
        // }
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            presentationMode.dismiss()
        }

    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(presentationMode: presentationMode, image: $image, imageUrl: $imageUrl)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController,
        context: UIViewControllerRepresentableContext<ImagePicker>) {

    }
    
}
