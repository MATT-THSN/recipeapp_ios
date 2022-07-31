//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by Matthew Thompson on 31/07/2022.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    // Link to view model
    private var recipeData = RecipeData()
    
    var body: some View {
        NavigationView {
            // Display each food category
            LazyVGrid(columns: [GridItem()], content: {
                ForEach(MainInformation.Category.allCases, id: \.self) { category in
                    Text(category.rawValue)
                        .font(.title)
                }
            })
            .navigationTitle("Categories")
        }
    }
}

struct RecipeCategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryGridView()
    }
}
