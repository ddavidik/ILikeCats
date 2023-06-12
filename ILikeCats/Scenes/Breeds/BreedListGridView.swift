//
//  BreedListGridView.swift
//  ILikeCats
//
//  Created by Daniel Davidík on 08.06.2023.
//

import SwiftUI

struct BreedListGridView: View {
    let breed: Breed
    
    var body: some View {
        AsyncImage(
            url: breed.image?.url) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .frame(width: 110, height: 110)
                        .cornerRadius(8)
                } else if phase.error != nil {
                    CatImage.getDefaultImage()
                } else {
                    ProgressView()
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .frame(width: 110, height: 110)
    }
}

struct BreedListGridView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListGridView(breed: Breed.mock)
    }
}
