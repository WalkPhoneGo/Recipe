//
//  NSUserDefaultsManager.swift
//  Recipe
//
//  Created by 吴世杭 on 29/08/2017.
//  Copyright © 2017 吴世杭. All rights reserved.
//

import UIKit

class NSUserDefaultsManager: NSObject {
    static let userDefaults = UserDefaults.standard
    
    class func synchronize(){
        let myData = NSKeyedArchiver.archivedData(withRootObject: RecipeManager.recipes)
        UserDefaults.standard.set(myData, forKey: "recipearray")
        UserDefaults.standard.synchronize()
    }
    
    class func initializeDefaults() {
        if let recipesRaw = UserDefaults.standard.data(forKey: "recipearray") {
            if let recipes = NSKeyedUnarchiver.unarchiveObject(with: recipesRaw) as? [Recipe] {
                RecipeManager.recipes = recipes
            }
        }
    }
}
