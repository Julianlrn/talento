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
    // @ObservedObject var imageLoader:ImageLoader
    @State private var instructions = ""
    @State private var title = ""
    @State var isShowPicker: Bool = false
    @State var image: Image? = Image("placeholder")
    
    func upload(){
        let db = Firestore.firestore()
        db.collection("challenges")
            .document()
            .setData(
            ["title":self.title, "instructions":self.instructions, "image": "https://firebasestorage.googleapis.com/v0/b/talento1-1.appspot.com/o/Images%2Fmountain.jpg?alt=media&token=78316d65-33a9-4b0f-a739-5efdc8cb20e6"]) { (err) in
                
                if err != nil{
                   
                    print((err?.localizedDescription)!)
                    return
                }
                
        }
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                TextField("Enter Challenge Description", text: $instructions)
                    .border(Color.black)
                
                TextField("Enter Challenge Name", text: $title)
                    .border(Color.black)
                
                // TODO: Image aus DB lesen und hochladen
                
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

                    
                }) {
                    Text("Submit")
                }
                List(challengeData.datas){i in
                    Text("Challenge: " + i.title + " Description: " +  i.instructions)
                    // Image(i.image)
                    
                }
                }
            .sheet(isPresented: $isShowPicker){ ImagePicker(image: self.$image)}
            .padding()
            .font(.title)
    }.navigationBarTitle("Create Challenge")
        

        
    }


struct ImagePicker: UIViewControllerRepresentable {

    @Environment(\.presentationMode)
    var presentationMode

    @Binding var image: Image?

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

        @Binding var presentationMode: PresentationMode
        @Binding var image: Image?

        init(presentationMode: Binding<PresentationMode>, image: Binding<Image?>) {
            _presentationMode = presentationMode
            _image = image
        }

        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            image = Image(uiImage: uiImage)
            presentationMode.dismiss()
            let imageData = uiImage.pngData()

        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            presentationMode.dismiss()
        }

    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(presentationMode: presentationMode, image: $image)
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
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
                let title = i.document.get("title") as! String
                let instructions = i.document.get("instructions") as! String
                let image = i.document.get("image") as! String
                self.datas.append(challengeDescription(id : id, title: title, instructions: instructions, image: image))
            }
        }
    }
}


struct challengeDescription : Identifiable {
    var id : String
    var title :String
    var instructions : String
    var image : String
}

struct ChallengeCreateView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeCreateView()
    }
}
}
