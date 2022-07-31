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
        let columns = [GridItem(), GridItem()]
        
        NavigationView {
            ScrollView {
                // Display each food category in two columns
                LazyVGrid(columns: columns, content: {
                    ForEach(MainInformation.Category.allCases, id: \.self) { category in
                        CategoryView(category: category)
                    }
                })
                .navigationTitle("Categories")
            }
        }
    }
}

struct CategoryView: View {
    let category: MainInformation.Category
    
    var body: some View {
        ZStack {
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.45)
            Text(category.rawValue)
                .font(.title)
        }
    }
}

struct RecipeCategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryGridView()
    }
}
