//
//  Meal.swift
//  mealTracker
//
//  Created by admin64 on 01/10/24.
//

import Foundation
struct Food {
    var name : String
    var description : String
}

struct Meal {
    var name: String
    var foods: [Food]
}

var meals:[Meal] = [Meal(name: "Breakfast", foods: [Food(name: "Idli", description: "Steamed rice and urad dal batter served with coconut chutney"), Food(name: "Pongal", description: "Boiled rice and moong dal serve"), Food(name: "Chole bature", description: "Boiled spiced chana with large pooris")]),
    Meal(name: "Lunch", foods: [Food(name: "Rajma Chaval", description: "Steamed rice with spiced rajma beans"), Food(name: "Biriyani", description: "spiced rice with meat")]),
    Meal(name: "Dinner", foods: [Food(name: "Chapati", description: "Chapathi served with curry varieties"), Food(name: "Shawrama", description: "Minced meat in chapati roll")])]
