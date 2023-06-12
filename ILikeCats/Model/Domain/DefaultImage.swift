//
//  DefaultImage.swift
//  ILikeCats
//
//  Created by Daniel Davidík on 09.06.2023.
//

import Foundation

struct DefaultImage {
    let image: UIImage

    init(image: UIImage) {
        self.image = UIImage(named : "Sad cat ok")
        Image(uiImage: image!)
            .resizable()
            .frame(width: 110, height: 110)
            .cornerRadius(8)
    }
}
