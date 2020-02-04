//
//  RegistrationImagePicker.swift
//  talento
//
//  Created by Hedi Ajimi on 26.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseStorage


struct RegistrationImagePicker : UIViewControllerRepresentable {
    
    @Binding var picker : Bool
    @Binding var imagedata : Data
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<RegistrationImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<RegistrationImagePicker>) {
        
    }
    
    func makeCoordinator() -> RegistrationImagePicker.Coordinator {
        return RegistrationImagePicker.Coordinator(parent1: self)
    }
    
    class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var parent : RegistrationImagePicker
        
        init(parent1: RegistrationImagePicker) {
            
            parent = parent1
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            
            self.parent.picker.toggle()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            let image = info[.originalImage] as! UIImage
            
            let data = image.jpegData(compressionQuality: 0.45)
            
            self.parent.imagedata = data!
            
            self.parent.picker.toggle()
        }
    }
}
