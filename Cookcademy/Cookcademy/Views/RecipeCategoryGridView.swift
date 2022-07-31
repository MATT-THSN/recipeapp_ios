//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by Matthew Thompson on 31/07/2022.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    // Link to view model
    // State Object so that SwiftUI knows to monitor this data to update the U.I if changes are made
    @StateObject private var recipeData = RecipeData()
    
    var body: some View {
        let columns = [GridItem(), GridItem()]
        
        NavigationView {
            ScrollView {
                // Display each food category in two columns
                LazyVGrid(columns: columns, content: {
                    ForEach(MainInformation.Category.allCases, id: \.self) { category in
                        NavigationLink(
                            destination: RecipiesListView(category: category)
                                .environmentObject(recipeData),
                            label: {
                                CategoryView(category: category)
                            })
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
                .opacity(0.25)
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
