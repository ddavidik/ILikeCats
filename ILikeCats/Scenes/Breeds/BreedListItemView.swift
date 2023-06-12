//
//  BreedListItemView.swift
//  ILikeCats
//
//  Created by Daniel Davidík on 08.06.2023.
//

import SwiftUI

struct BreedListItemView: View {
    let breed: Breed
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 16) {
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
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(breed.name)
                        .font(.appItemLargeTitle)
                        .foregroundColor(.appTextItemTitle)
                        .multilineTextAlignment(.leading)
                    
                    Text(breed.origin)
                        .font(.appItemDescription)
                }
                .padding(.vertical, 16)
            }
            
            Text(breed.description)
                .font(.appItemDescription)
                .multilineTextAlignment(.leading)
                .padding(.vertical, 8)
            Divider()
                .overlay(.white)
        }
        .frame(alignment: .leading)
    }
}

struct BreedListItemView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListItemView(breed: Breed.mock)
    }
}
