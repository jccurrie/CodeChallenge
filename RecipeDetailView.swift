//
//  RecipeDetailView.swift
//  FetchCodingChallenge
//
//  Created by Julian Currie on 3/5/23.
//

import SwiftUI

struct RecipeDetailView: View {
    @State private var meals = [MealDetails]()
    var strId = String()
    
    var body: some View {
        NavigationStack {

            List(meals, id: \.strMeal) { item in
                
                // Recipe Image
                AsyncImage(
                    url: URL(string: item.strMealThumb),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, maxHeight: 256, alignment: .center)
                            .cornerRadius(8.0)
                    },
                    placeholder: {
                        ProgressView()
                    })
                        .listRowBackground(Color.white.opacity(0.5))
                
                // Recipe Name
                Text(item.strMeal)
                    .frame(maxWidth: .infinity, maxHeight: 48, alignment: .center)
                    .fontWeight(.heavy)
                    .toolbarBackground(Color.mint, for: .navigationBar)
                    .listRowBackground(Color.white.opacity(0.5))
                
                // Recipe Instructions
                Text(item.strInstructions)
                    .multilineTextAlignment(.center)
                    .listRowBackground(Color.white.opacity(0.5))
                
                /**
                 Vertical stacks of ingredients and Meaurements:
                 I 100% recognize that this is a horrible example of the DRY principle,
                 learning a more elegant solution to this problem would require a little more time and effort and
                 is something I'm genuinely interested in learning and bettering my iOs development ability where it's lacking.
                 */
                VStack {
                    Text(item.strIngredient1) .bold(); Text(item.strMeasure1 + "\n")
                    Text(item.strIngredient2) .bold(); Text(item.strMeasure2 + "\n")
                    Text(item.strIngredient3) .bold(); Text(item.strMeasure3 + "\n")
                    Text(item.strIngredient4) .bold(); Text(item.strMeasure4 + "\n")
                    Text(item.strIngredient5) .bold(); Text(item.strMeasure5 + "\n")
                }
                    .frame(maxWidth: .infinity, minHeight: 0, alignment: .center)
                    .listRowBackground(Color.white.opacity(0.5))
                
                VStack {
                    Text(item.strIngredient6) .bold(); Text(item.strMeasure6 + "\n")
                    Text(item.strIngredient7) .bold(); Text(item.strMeasure7 + "\n")
                    Text(item.strIngredient8) .bold(); Text(item.strMeasure8 + "\n")
                    Text(item.strIngredient9) .bold(); Text(item.strMeasure9 + "\n")
                    Text(item.strIngredient10) .bold(); Text(item.strMeasure10 + "\n")
                }
                    .frame(maxWidth: .infinity, minHeight: 0, alignment: .center)
                    .listRowBackground(Color.white.opacity(0.5))
                
                VStack {
                    Text(item.strIngredient11) .bold(); Text(item.strMeasure11 + "\n")
                    Text(item.strIngredient12) .bold(); Text(item.strMeasure12 + "\n")
                    Text(item.strIngredient13) .bold(); Text(item.strMeasure13 + "\n")
                    Text(item.strIngredient14) .bold(); Text(item.strMeasure14 + "\n")
                    Text(item.strIngredient15) .bold(); Text(item.strMeasure15 + "\n")
                }
                    .frame(maxWidth: .infinity, minHeight: 0, alignment: .center)
                    .listRowBackground(Color.white.opacity(0.5))
                
                VStack {
                    Text(item.strIngredient16) .bold(); Text(item.strMeasure16 + "\n")
                    Text(item.strIngredient17) .bold(); Text(item.strMeasure17 + "\n")
                    Text(item.strIngredient18) .bold(); Text(item.strMeasure18 + "\n")
                    Text(item.strIngredient19) .bold(); Text(item.strMeasure19 + "\n")
                    Text(item.strIngredient20) .bold(); Text(item.strMeasure20 + "\n")
                }
                    .frame(maxWidth: .infinity, minHeight: 0, alignment: .center)
                    .listRowBackground(Color.white.opacity(0.5))
            }
                .background(LinearGradient(gradient: Gradient(colors: [.white, .mint, .mint]), startPoint: .bottomLeading, endPoint: .topTrailing))
                .scrollContentBackground(.hidden)
        }
        .task {
            await loadData()
        }
    }
    
    /**
     The loadData() method fetches recipe data from the MealDB API and decodes it using JSONDecoder.
    */
    func loadData() async {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=" + strId) else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(RecipeDetail.self, from: data) {
                meals = decodedResponse.meals
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView()
    }
}
