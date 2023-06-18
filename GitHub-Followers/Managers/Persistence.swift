//
//  Persistence.swift
//  GitHub-Followers
//
//  Created by APPLE on 15/06/2023.
//

import Foundation


enum PersistenceType {
    case add, remove
}


enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum keys {
        static let favorites = "favorites"
    }
    
    
    static func updateWith(favorite: Follower, actionType: PersistenceType, completed: @escaping(GFError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(let favorites) :
                var retrievedFavorites = favorites
                
                switch actionType {
                case .add:
                    guard !retrievedFavorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    
                    retrievedFavorites.append(favorite)
                    
                    
                case .remove:
                    retrievedFavorites.removeAll { $0.login == favorite.login }
                }
                
                completed(save(favorites: retrievedFavorites))
                
            case .failure(let error) :
                completed(error)
            }
            
        }
    }
    
    
    static func retrieveFavorites(completed: @escaping(Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    
    static func save(favorites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
