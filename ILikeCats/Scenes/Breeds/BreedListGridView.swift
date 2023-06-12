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
            url: breed.image?.url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 110, height: 110)
            } placeholder: {
                let image = UIImage(named: "Sad cat ok")
                Image(uiImage: image!)
                    .resizable()
                    .frame(width: 110, height: 110)
                    .cornerRadius(8)
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
