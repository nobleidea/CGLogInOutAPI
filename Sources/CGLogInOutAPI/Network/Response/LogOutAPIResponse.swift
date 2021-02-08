//
//  LogOutAPIResponse.swift
//  LogInOutAPI
//
//  Created by gyun on 2021/02/03.
//

import Foundation
import CGNetwork

struct LogOutAPIResponse<T: Decodable> {
    let result: LogOutAPIResult<T>
    let statusCode: Int
    let requestURL: URL?
    
    init(_ response: DataResponse) {
        let statusCode = response.response?.statusCode ?? -9999
        
        self.requestURL = response.request?.url
        self.statusCode = statusCode
        
        if case 200 = self.statusCode, let data = response.data {
            let decoder = JSONDecoder()
            
            do {
                let decoded = try decoder.decode(T.self, from: data)
                self.result = LogOutAPIResult<T>.success(decoded)
            } catch  {
                if let error = response.error {
                    self.result = LogOutAPIResult<T>.failure(LogOutAPIError(.unknown, error: error))
                } else {
                    fatalError()
                }
            }
        } else {
            fatalError()
        }
    }
}

struct LogOutAPIError: Error {
    private let errorType: CGNetwork.ErrorType
    private let error: Error
    
    init(_ errorType: CGNetwork.ErrorType, error: Error) {
        self.errorType = errorType
        self.error = error
    }
}

enum LogOutAPIResult<T: Decodable> {
    case success(T)
    case failure(LogOutAPIError)
}


