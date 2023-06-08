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
                        if let breed = viewModel.breed {
                            makeImage(url: breed.image?.url)
                            makeInfo(breed: breed)
                        }
                        
                    case .failed:
                        Text("Sorry, breed fetch failed *sad face emoji*")
                    }
                }
            }
        }
        .navigationTitle(viewModel.breed?.name ?? "")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if let url = breed.wikiUrl {
                    Link("Wifi page", destination: url)
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

    func makeInfo(breed: Breed) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("Info")
                .font(.appSectionTitle)
                .foregroundColor(.appTextSectionTitle)

            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 16) {
                    makeInfoRow(title: breed.name, iconName: "person.text.rectangle.fill")
                    makeInfoRow(title: breed.description, iconName: "text.quote")
                    makeInfoRow(title: breed.life_span, iconName: "heart.fill")
                    makeInfoRow(title: breed.origin, iconName: "globe")
                }

            }
        }
        .padding(.horizontal, 8)
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

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BreedDetailView(breed: Breed.mock, viewModel: BreedDetailViewModel(id: "abob"))
        }
    }
}

