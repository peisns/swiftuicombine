//
//  NewPostView.swift
//  swiftuicombine
//
//  Created by air on 4/30/25.
//

import SwiftUI

struct NewPostView: View {
    @State var caption = ""
    @Binding var tabIndex: Int
    
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
            
            Image(.imageDog)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)

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
}

#Preview {
//    NewPostView(tabIndex: <#T##Binding<Int>#>)
}
