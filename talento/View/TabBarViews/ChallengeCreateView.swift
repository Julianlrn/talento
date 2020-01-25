//
//  ChallengeCreateView.swift
//  talento
//
//  Created by Gökay Inan on 04.01.20.
//  Copyright © 2020 JulianLorenz. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseUI

struct ChallengeCreateView: View {
    
    @ObservedObject var challengeData = getChallengeData()
   // @ObservedObject var imageLoader: ImageLoader
    @State private var description = ""
    @State private var name = ""
    // @Published var imgName: String = ""
    @State var isShowPicker: Bool = false
    @State var image: Image? = Image("placeholder")
    @State var imageUrl : String? = ""
    
    @Binding var isPresented : Bool
    
    
    func upload(){
        let db = Firestore.firestore()
        db.collection("challenges")
            .document()
            .setData(
            ["title":self.name, "instructions":self.description, "image": self.imageUrl!]) { (err) in
                
                if err != nil{
                   
                    print((err?.localizedDescription)!)
                    return
                }
        }
    }
    
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                TextField("Enter Challenge Description", text: $description)
                    .border(Color.black)
                
                TextField("Enter Challenge Name", text: $name)
                    .border(Color.black)
                // TODO: Image aus DB lesen und hochladen
                image?.resizable().scaledToFit().frame(height: CGFloat(320))
                                      Button(action: {
                                          withAnimation {
                                              self.isShowPicker.toggle()
                                          }
                                      }) {
                                          Image(systemName: "photo")
                                              .font(.headline)
                                          Text("IMPORT").font(.headline)
                                      }.foregroundColor(.black)
                                      Spacer()
                Button(action: {
                    self.upload()
                    self.isPresented.toggle()
                }) {
                    HStack {
                        Text("Submit")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color.white)
                            .padding(24)
                    }
                    .frame(width: 343)
                    .background(Color.init(red:0.96, green:0.11, blue:0.34))
                    .cornerRadius(16)
                    .shadow(color: Color.init(red:0.00, green:0.00, blue:0.00, opacity: 0.16), radius: 8, x: 0, y: 4)
                    .padding(.bottom, 24)
                }
              
                /*List(challengeData.datas){i in
                    Text("Challenge: " + i.name + " Description: " +  i.description)
                    
                }*/
                }
            .sheet(isPresented: $isShowPicker){ ImagePicker(image: self.$image, imageUrl: self.$imageUrl)}
            .padding()
            .font(.title)
            .navigationBarTitle("Create Challenge")
        }
    }


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


class getChallengeData : ObservableObject{
    @Published var datas = [challengeDescription]()
    
    init() {
        let db = Firestore.firestore()
        
        db.collection("challenges").addSnapshotListener{ (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documentChanges{
                let id = i.document.documentID
                let name = i.document.get("title") as! String
                let description = i.document.get("instructions") as! String
                 let image = i.document.get("image") as! String
                
                self.datas.append(challengeDescription(id : id, name: name, description: description, image:image))
            }
        }
    }
}



struct challengeDescription : Identifiable {
    var id : String
    var name :String
    var description : String
    var image : String
}

}

