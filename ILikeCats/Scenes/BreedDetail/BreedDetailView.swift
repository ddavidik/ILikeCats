//
//  BreedDetailView.swift
//  ILikeCats
//
//  Created by Daniel Davidík on 08.06.2023.
//

import SwiftUI

struct BreedDetailView: View {
    
    let breed: Breed
    @StateObject var viewModel: BreedDetailViewModel
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            BackgroundGradientView()
            
            ScrollView {
                VStack(spacing: 16) {
                    switch viewModel.state {
                    case .initial:
                        ProgressView()
                    case .loading:
                        ProgressView()
                    case .fetched:
                        if let images = viewModel.images {
                            makeImageSlider(images: images)
                        }
                        if let breed = viewModel.breed {
                            makeInfo(breed: breed)
                        }
                    case .failed:
                        Text("Sorry, 🐈 fetch failed *sad face emoji*")
                    }
                }
            }
        }
        .navigationTitle(viewModel.breed?.name ?? "")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if let url = breed.wikiUrl {
                    Link("Wiki page", destination: url)
                        .font(.appItemSmallTitle)
                        .foregroundColor(.blue)
                }
            }
        }
        .onFirstAppear {
            Task {
                await viewModel.fetch()
            }
        }
    }
}

private extension BreedDetailView {
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
    
    func makeImageSlider(images: [CatImage]) -> some View {
        ImageSlider(images: images)
            .frame(minWidth: UIScreen.main.bounds.size.width, minHeight: 300)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
    
    func makeInfo(breed: Breed) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("General")
                .font(.appSectionTitle)
                .foregroundColor(.appTextSectionTitle)
            
            makeInfoRow(title: breed.origin, iconName: "globe")
            makeInfoRow(title: breed.lifeSpan + " years", iconName: "heart.fill")
            makeInfoRow(title: breed.weight.metric + " kg", iconName: "scalemass")
            
            Text("Description")
                .font(.appSectionTitle)
                .foregroundColor(.appTextSectionTitle)
            
            makeInfoRow(title: breed.temperament, iconName: "face.smiling")
            makeInfoRow(title: breed.description, iconName: "info.square.fill")
            
        }
        .padding(8)
    }
    
    func makeInfoRow(title: String, iconName: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: iconName)
            Text(title)
        }
        .font(.appItemDescription)
        .foregroundColor(.appTextBody)
    }
}

struct BreedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BreedDetailView(breed: Breed.mock, viewModel: BreedDetailViewModel(id: "abob"))
        }
    }
}

