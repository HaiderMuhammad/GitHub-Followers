//
//  Network.swift
//  GitHub-Followers
//
//  Created by APPLE on 01/06/2023.
//

import UIKit

class NetworkManager {
    static let shared       = NetworkManager()
    private let baseURL     = "https://api.github.com/users/"
    let cache               = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping(Result<[Follower], GFError>)-> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        fetchData(endpoint: endpoint, completed: completed)
    }
    
    
    func getUserInfo(for username: String, completed: @escaping(Result<User, GFError>)-> Void) {
        let endpoint = baseURL + "\(username)"
        fetchData(endpoint: endpoint, completed: completed)
    }
    
    
    func fetchData<T: Decodable>(endpoint: String, completed: @escaping(Result<T, GFError>)-> Void) {
        guard let url = URL(string: endpoint) else {
            completed(.failure(.inValidUsername))
            return
        }
        
        let configuration = URLSessionConfiguration.default
        let session       = URLSession(configuration: configuration)
        
        let task = session.dataTask(with: url) {data, response, error in
            
            guard error == nil else {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let data = try decoder.decode(T.self, from: data)
                completed(.success(data))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
