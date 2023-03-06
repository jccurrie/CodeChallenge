//
//  ContentView.swift
//  FetchCodingChallenge
//
//  Created by Julian Currie on 3/5/23.
//

import SwiftUI

struct ContentView: View {
    @State private var meals = [Meal]()
    @State var selectedId = ""
    
    /**
     This view uses the NavigationStack from the NavigationStack library to enable multiple navigation views. The body displays a List of meals, where each meal is a NavigationLink to the RecipeDetailView.
     */
    var body: some View {
        NavigationStack {
            List(meals, id: \.strMeal) { item in
                
                VStack(alignment: .leading) {
                    Text("")
                        .navigationTitle("Desserts")
                        .toolbarBackground(Color.mint, for: .navigationBar)
                    
                    NavigationLink(destination: RecipeDetailView(strId: item.idMeal)) {
                        HStack {
                            
                            // Recipe Image
                            AsyncImage(
                                url: URL(string: item.strMealThumb),
                                content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 48, maxHeight: 48)
                                        .cornerRadius(5.0)
                                },
                                placeholder: {
                                    ProgressView()
                                })
                            
                            // Recipe Name
                            Text(item.strMeal)
                                .foregroundColor(.black)
                                .bold()
                        }
                    }
                }
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
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(RecipeList.self, from: data) {
                meals = decodedResponse.meals
            }
        } catch {
            print("Invalid data")
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
