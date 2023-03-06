//
//  RecipeData.swift
//  FetchCodingChallenge
//
//  Created by Julian Currie on 3/5/23.
//

import Foundation

/**
This is the RecipeAPI class which acts as a singleton instance to make API requests for recipe data.
*/
final class RecipeAPI {
    
    static let shared = RecipeAPI()
    
}

/**
This is the struct representing the list of meals returned by the recipe API.
*/
struct RecipeList: Codable {
    let meals: [Meal]
}

/**
This is the struct representing the detailed information for a single meals details returned by the recipe API.
*/
struct RecipeDetail: Codable {
    let meals: [MealDetails]
}

/**
This is the struct representing detailed information for a single meal.
*/
struct MealDetails: Codable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    let strInstructions: String
    let strIngredient1: String
    let strIngredient2: String
    let strIngredient3: String
    let strIngredient4: String
    let strIngredient5: String
    let strIngredient6: String
    let strIngredient7: String
    let strIngredient8: String
    let strIngredient9: String
    let strIngredient10: String
    let strIngredient11: String
    let strIngredient12: String
    let strIngredient13: String
    let strIngredient14: String
    let strIngredient15: String
    let strIngredient16: String
    let strIngredient17: String
    let strIngredient18: String
    let strIngredient19: String
    let strIngredient20: String
    let strMeasure1: String
    let strMeasure2: String
    let strMeasure3: String
    let strMeasure4: String
    let strMeasure5: String
    let strMeasure6: String
    let strMeasure7: String
    let strMeasure8: String
    let strMeasure9: String
    let strMeasure10: String
    let strMeasure11: String
    let strMeasure12: String
    let strMeasure13: String
    let strMeasure14: String
    let strMeasure15: String
    let strMeasure16: String
    let strMeasure17: String
    let strMeasure18: String
    let strMeasure19: String
    let strMeasure20: String
}

/**
This is the struct representing a single meal returned by the recipe API.
*/
struct Meal: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
