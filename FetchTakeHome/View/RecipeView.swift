//
//  RecipeView.swift
//  FetchTakeHome
//
//  Created by Serg Tsogtbaatar on 1/11/25.
//

import SwiftUI

struct RecipeView: View {
    let recipe: Recipe

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: recipe.photo_large)) { image in
                image.image?.resizable()
                    .frame(height: 200)
                    .clipped()
            }
            Text(recipe.name)
                .font(.title)
            Text(recipe.cuisine)
                .font(.subheadline)
        }
    }
}

#Preview {
    RecipeView(recipe: Recipe(cuisine: "Mongolian", name: "Buuz", photo_large: "", photo_small: "", id: "1", source: "", youtube: ""))
}
