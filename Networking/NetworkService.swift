//
//  NetworkService.swift
//  PartyOrganizer
//
//  Created by Dusan Mitrasinovic on 8/16/21.
//

import Foundation

class NetworkService {
    
    class func request<T: Decodable>(router: Router, completion: @escaping (Result<T, Error>) -> ()) {
        let url = URL(string: router.path)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = router.method
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            guard response != nil else {
                return
            }
            guard let data = data else {
                return
            }
            
            if let parsedData = try? JSONSerialization.jsonObject(with: data) as? [String:Any],
               let statusList = parsedData["profiles"] as? [Member] {
                print(statusList)

            }
        
            if let decoded = try? JSONDecoder().decode(MemberResponse.self, from: data) {
                print("Decoded : \(decoded)")
                
            } else {
                return
            }
            
//            if let responseObject = try? JSONDecoder().decode(T.self, from: data) {
//                DispatchQueue.main.async {
//                    completion(.success(responseObject))
//                }
//            } else {
//                return
//            }
        }
        dataTask.resume()
    }
}
