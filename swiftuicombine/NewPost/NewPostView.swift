//
//  NewPostView.swift
//  swiftuicombine
//
//  Created by air on 4/30/25.
//

import SwiftUI
import PhotosUI

struct NewPostView: View {
    
    @Binding var tabIndex: Int
    @State var viewModel = NewPostViewModel()
    
    
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
            PhotosPicker(selection: $viewModel.selectedPhotoItem) {
                if let postImage = viewModel.postImage {
                    postImage
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                } else {
                    Image(systemName: "photo.on.rectangle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding()
                }
            }
            .onChange(of: viewModel.selectedPhotoItem) { _, newValue in
                Task { await viewModel.convertImage(item: newValue) }
            }
            
            TextField("문구를 작성하거나 설문을 추가하세요", text: $viewModel.caption)
                .padding()
            
            Spacer()
            
            Button {
                Task { await viewModel.uploadPost() }
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
    
}

#Preview {
//    NewPostView(tabIndex: <#T##Binding<Int>#>)
}
