//
//  Networkmanager.swift
//  TestApp
//
//  Created by shaiju on 09/01/24.
//

import Foundation


class NetworkManager {
    //MARK: - Get users from Network
   
    public func getUserdetails(
        completion: @escaping (Result<GetUsersApiResponse, Error>) -> ()
    )  {
        let url = URL(string: Appconsatants.baseUrl.rawValue)!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _,error in
            if let data = data {
                /// do exception handler so that our app does not crash
                do {
                    let result = try JSONDecoder().decode(GetUsersApiResponse.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
