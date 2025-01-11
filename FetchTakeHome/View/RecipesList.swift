//
//  RecipesList.swift
//  FetchTakeHome
//
//  Created by Serg Tsogtbaatar on 1/11/25.
//

import SwiftUI

struct RecipesList: View {
    @State private var viewModel = RecipesViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.recipes.isEmpty {
                    EmptyView()
                } else {
                    List {
                        ForEach(viewModel.recipes) { recipe in
                            RecipeView(recipe: recipe)
                        }
                    }
                    .navigationTitle("Recipes")
                }
            }
            .task {
                do {
                    viewModel.recipes = try await viewModel.performNetworkCall()
                } catch {
                    print("Error")
                }
            }
            .refreshable {
                do {
                    viewModel.recipes = try await viewModel.performNetworkCall()
                } catch {
                    print("Error")
                }
            }
        }
    }
}

#Preview {
    RecipesList()
}
