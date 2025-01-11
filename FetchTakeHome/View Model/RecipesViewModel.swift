//
//  RecipesViewModel.swift
//  FetchTakeHome
//
//  Created by Serg Tsogtbaatar on 1/11/25.
//

import Foundation

@Observable
class RecipesViewModel: ObservableObject {
    
    var recipes: [Recipe] = []
    
    func performNetworkCall() async throws -> [Recipe] {
        guard let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json") else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        print("Status code: \(response.statusCode)")
        print("Data successfully retreived: \(data)")
        let wrapper = try JSONDecoder().decode(RecipesWrapper.self, from: data)
        DispatchQueue.main.async {
            self.recipes = wrapper.recipes
        }
        return wrapper.recipes
    }
}
