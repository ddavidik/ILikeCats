//
//  ImageSlider.swift
//  ILikeCats
//
//  Created by Daniel Davidík on 10.06.2023.
//

import SwiftUI

struct ImageSlider: View {
    let images: [CatImage]
    
    var body: some View {
        TabView {
            ForEach(images) { item in
                AsyncImage(url: item.url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity)
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct ImageSlider_Previews: PreviewProvider {
    static var previews: some View {
        ImageSlider(images: [CatImage.mock, CatImage.mock])
    }
}
