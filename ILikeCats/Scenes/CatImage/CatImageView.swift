//
//  CatImageView.swift
//  ILikeCats
//
//  Created by Daniel Davidík on 12.06.2023.
//

import SwiftUI

struct CatImageView: View {
    
    @StateObject var viewModel: CatImageViewModel
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            BackgroundGradientView()
            
            switch viewModel.state {
            case .initial:
                ProgressView()
            case .loading:
                ProgressView()
            case .fetched:
                if let images = viewModel.images {
                    VStack {
                        makeImage(url: images[0].url)
                        Spacer()
                        HStack(spacing: 16) {
                            makeButton(text: "YES!")
                            makeButton(text: "MORE!")
                        }
                    }
                    .padding(16)
                }
            case .failed:
                Text("Sorry, 🐈 fetch failed *sad face emoji*")
            }
        }
        .navigationTitle("Random image")
        .onFirstAppear {
            Task {
                await viewModel.fetch()
            }
        }
    }
}

private extension CatImageView {
    func makeImage(url: URL?) -> some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        } placeholder: {
            ProgressView()
        }
        .frame(maxWidth: .infinity)
    }
    
    func makeButton(text: String) -> some View {
        Button(action: {
            Task {
                await viewModel.fetch()
            }
        }) {
            Text(text)
                .font(.appSectionTitle)
                .foregroundColor(.blue)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.blue, lineWidth: 2)
                )
        }
    }
}

struct CatImageView_Previews: PreviewProvider {
    static var previews: some View {
        CatImageView(viewModel: CatImageViewModel())
    }
}
