//
//  NewPostViewModel.swift
//  swiftuicombine
//
//  Created by air on 5/31/25.
//

import SwiftUI
import PhotosUI
import FirebaseStorage
import Firebase
import FirebaseFirestoreSwift

struct Post: Codable {
    let id: String
    let caption: String
    var like: Int
    let imageUrl: String
    let date: Date
}

@Observable // @Observable로 내부의 변수 전부 감시 가능
final class NewPostViewModel {
    var caption = ""
    var selectedPhotoItem: PhotosPickerItem?
    var postImage: Image?
    var uiImage: UIImage?
    
    func convertImage(item: PhotosPickerItem?) async{
        guard let item,
              let data = try? await item.loadTransferable(type: Data.self),
              let uiImage = UIImage(data: data) else {
            return
        }
        
        postImage = Image(uiImage: uiImage)
        self.uiImage = uiImage
    }
    
    func uploadPost() async {
        guard let uiImage,
              let imageUrl = await uploadImage(image: uiImage) else {
            return
        }
        
        let postReference = Firestore.firestore().collection("post").document()
        let post = Post(id: postReference.documentID, caption: caption
                        , like: 0, imageUrl: imageUrl, date: Date())
        do {
            let encodedData = try Firestore.Encoder().encode(post)
            try await postReference.setData(encodedData)
        } catch {
            
        }
        
        
    }
    
    func uploadImage(image: UIImage) async -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        
        let fileName = UUID().uuidString
        let reference = Storage.storage().reference(withPath: "/images/\(fileName)")
        do {
            let metaData = try await reference.putDataAsync(imageData)
            let url = try await reference.downloadURL()
            return url.absoluteString
        } catch {
            print(error.localizedDescription)
            return nil
        }
        
    }
}
