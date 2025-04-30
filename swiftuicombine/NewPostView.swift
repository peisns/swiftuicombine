//
//  NewPostView.swift
//  swiftuicombine
//
//  Created by air on 4/30/25.
//

import SwiftUI
import PhotosUI

struct NewPostView: View {
    @State var caption = ""
    @Binding var tabIndex: Int
    @State var selectedPhotoItem: PhotosPickerItem?
    @State var postImage: Image?
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    tabIndex = 0
                } label: {
                    Image(systemName: "chevron.left")
                        .tint(.black)
                }
                Spacer()
                Text("새 게시물")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.horizontal)
            PhotosPicker(selection: $selectedPhotoItem) {
                if let postImage {
                    postImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                } else {
                    Image(systemName: "photo.on.rectangle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .padding()
                }
            }
            .onChange(of: selectedPhotoItem) { _, newValue in
                Task { self.postImage = await convertImage(item: newValue) }
            }
            
            TextField("문구를 작성하거나 설문을 추가하세요", text: $caption)
                .padding()
            
            Spacer()
            
            Button {
                print("사진 공유")
            } label: {
                Text("공유")
                    .frame(width: 363, height: 42)
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding()

        }
    }
    
    func convertImage(item: PhotosPickerItem?) async -> Image? {
        guard let item,
              let image = try? await item.loadTransferable(type: Image.self) else {
            return nil
        }
        return image
    }
}

#Preview {
//    NewPostView(tabIndex: <#T##Binding<Int>#>)
}
