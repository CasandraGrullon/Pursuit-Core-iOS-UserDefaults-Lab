//
//  HoroscopeAPIClient.swift
//  UserDefaultsLab
//
//  Created by casandra grullon on 1/13/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import Foundation
import NetworkHelper

struct HoroscopeAPIClient {
    static func getHoroscope(for horoscope: String, completion: @escaping (Result<Horoscope, AppError>) -> () ){
        
        let endpointURL = "http://sandipbgt.com/theastrologer/api/horoscope/\(horoscope)/today"
        
        guard let url = URL(string: endpointURL) else {
            completion(.failure(.badURL(endpointURL)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let horoscope = try JSONDecoder().decode(Horoscope.self, from: data)
                    completion(.success(horoscope))
                }catch{
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        
    }
}
