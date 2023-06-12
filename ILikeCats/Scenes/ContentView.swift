//
//  ContentView.swift
//  ILikeCats
//
//  Created by Daniel Davidík on 07.06.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                BreedListView(viewModel: BreedListViewModel())
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Image(systemName: "list.bullet")
                
                Text("Breeds")
            }
            
            NavigationView {
                CatImageView(viewModel: CatImageViewModel())
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Image(systemName: "photo")
                
                Text("Images")
            }
        }
        .foregroundColor(.appTextBody)
        .preferredColorScheme(.none)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
