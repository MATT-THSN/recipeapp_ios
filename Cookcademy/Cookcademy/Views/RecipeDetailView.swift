//
//  RecipeDetailView.swift
//  Cookcademy
//
//  Created by Matthew Thompson on 15/07/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    // Get a single recipe rather than an array of recipes
    let recipe: Recipe
    
    var body: some View {
        VStack {
            // Display recipe information
            HStack {
                // Author of recipe
                Text("Author: \(recipe.mainInformation.author)")
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            HStack {
                // Description of recipe
                Text(recipe.mainInformation.description)
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            List {
                // Recipe ingredients displayed via a loop
                Section(header: Text("Ingredients")) {
                    // \.self uses the entire recipe as the identifier
                    ForEach(recipe.ingredients.indices, id: \.self) { index in
                        let ingredient = recipe.ingredients[index]
                        Text(ingredient.description)
                    }
                }
            }
        }
        .navigationTitle(recipe.mainInformation.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    // Create a variable to store the first test recipe
    @State static var recipeForPreview = Recipe.testRecipes[0]
    static var previews: some View {
        NavigationView {
            // Pass in recipeForPreview variable to generate a preview
            RecipeDetailView(recipe: recipeForPreview)
        }
    }
}
