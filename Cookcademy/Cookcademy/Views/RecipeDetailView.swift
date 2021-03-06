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
    
    // Store background and text colour to be used in view.
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
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
                            .foregroundColor(listTextColor)
                    }
                }
                .listRowBackground(listBackgroundColor)
                
                // Recipe directions displayed via a loop
                Section(header: Text("Directions")) {
                    ForEach(recipe.directions.indices, id: \.self) { index in
                        // Store recipe.directions[index] in direction to make code more readable
                        let direction = recipe.directions[index]
                        HStack {
                            // Display direction number
                            Text("\(index + 1). ").bold()
                            
                            /*
                                Check IF a direction is optional { Append optional text }
                                Append direction description string
                             */
                            Text("\(direction.isOptional ? "(Optional) " : "")"
                                 + "\(direction.description)")
                        }
                        .foregroundColor(listTextColor)
                    }
                }
                .listRowBackground(listBackgroundColor)
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
