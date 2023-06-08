//
//  BackgroundGradientView.swift
//  ILikeCats
//
//  Created by Daniel Davidík on 07.06.2023.
//

import SwiftUI

struct BackgroundGradientView: View {
    var body: some View {
        LinearGradient(
            gradient: .init(colors: [.appBackgroundGradientTop, .appBackgroundGradientBottom]),
            startPoint: .top,
            endPoint: .bottom
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundGradientView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGradientView()
    }
}

