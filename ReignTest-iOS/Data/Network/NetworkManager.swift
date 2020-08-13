//
//  NetworkManager.swift
//  ReignTest
//
//  Created by Daniel Santamaria on 7/31/20.
//  Copyright © 2020 Reign. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    private let alamofire: Session
    
    init(alamofire: Session = AF) {
        self.alamofire = alamofire
    }
    
    func request<T: Decodable>(
        endpoint: String,
        onCompletion: @escaping (Result<T>) -> Void
    ) {
        alamofire.request(
            ServerConstants.BASE_URL + endpoint,
            method: HTTPMethod.get,
            parameters: nil,
            encoding: URLEncoding.default,
            headers: nil
        ).responseJSON { [weak self] response in
            guard let self = self else { return }
            switch response.result {
            case .success:
                self.onSuccess(data: response.data, onCompletion: onCompletion)
            case .failure:
                self.onError(error: response.error, onCompletion: onCompletion)
            }
        }
    }
    
    private func onSuccess<T: Decodable>(
        data: Data?,
        onCompletion: @escaping (Result<T>) -> Void
    ) {
        if let dataAsJson = data {
            do {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = ServerConstants.DATE_FORMAT
                dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                
                let dataAsObject = try decoder.decode(T.self, from: dataAsJson)
                onCompletion(Result.success(data: dataAsObject))
            } catch {
                onCompletion(Result.error(error: error))
            }
        } else {
            onCompletion(Result.error(error: EmptyResponseError()))
        }
    }
    
    private func onError<T>(
        error afError: AFError?,
        onCompletion: @escaping (Result<T>) -> Void
    ) {
        if let error = afError {
            onCompletion(Result.error(error: error))
        } else {
            onCompletion(Result.error(error: NetworkError()))
        }
    }
}
