//
//  APICaller.swift
//  NewsProject
//
//  Created by Utku Çetinkaya on 7.09.2022.
//

import Foundation

struct Constants {
    static let baseURL = "https://newsapi.org"
    static let APIKey = "b4bf5e9ea49a49a4807f83438cd8e006"
}

class APICaller {
    static let shared = APICaller()
    
    func topHeadlines(completion: @escaping (Result<[Article], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/v2/top-headlines?country=us&apiKey=\(Constants.APIKey)") else
        {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            
            if let error = error {
                
                completion(.failure(error))
    
            }else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    completion(.success(result.articles))
                }catch{
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    func searchNews(query: String, completion: @escaping (Result<[Article], Error>) -> Void) {

        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else { return}
        guard let url = URL(string: "\(Constants.baseURL)/v2/everything?q=\(query)&apiKey=\(Constants.APIKey)") else
        {return}

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in

            if let error = error {
                completion(.failure(error))
            }else if let data = data {

                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    completion(.success(result.articles))
                }catch{
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
