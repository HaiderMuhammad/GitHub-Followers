//
//  ErrorMessage.swift
//  GitHub-Followers
//
//  Created by APPLE on 01/06/2023.
//

import Foundation


enum GFError: String, Error {
    case inValidUsername    = "This username an invalid request. Please try again."
    case unableToComplete   = "Unable to complete your request. Please check your internet connection"
    case invalidResponse    = "Invalid response from the server. Please try again"
    case invalidData        = "The data received from the server was invalid. please try again."
    case unableToFavorite   = "There was an error favoriting this user. Please try again"
    case alreadyInFavorites = "You've already favorited this user. you must REALLY like them!"
}
