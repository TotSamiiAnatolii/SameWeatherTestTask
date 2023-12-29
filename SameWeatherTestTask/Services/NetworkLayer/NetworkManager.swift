//
//  APIService.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 25.12.2023.
//

import Foundation
import RxSwift
import RxCocoa

protocol NetworkManagerProtocol: AnyObject {
    
    func fetchModels<T: Decodable>(from url: URL?) -> Observable<T>
}

final class NetworkManager: NetworkManagerProtocol {
    
    public func fetchModels<T: Decodable>(from url: URL?) -> Observable<T> {
        
        guard let url else {
            return .error(NetworkManagerError.urlIsNil)
        }
        
        let request = URLRequest(url: url)
        
        return URLSession.shared.rx.response(request: request)
            .map { response, data -> T in
                let decoder = JSONDecoder()
                return try decoder.decode(T.self, from: data)
            }
            .catch { error in
                print("Network error: \(error)")
                return .error(error)
            }
            .asObservable()
    }
}
