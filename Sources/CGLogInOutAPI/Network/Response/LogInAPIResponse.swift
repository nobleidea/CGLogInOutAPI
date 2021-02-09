//
//  LogInAPIResponse.swift
//  LogInOutAPI
//
//  Created by gyun on 2021/02/03.
//

import Foundation
import CGNetwork

struct LogInAPIResponse<T: Decodable> {
    let result: LogInAPIResult<T>
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
                self.result = LogInAPIResult<T>.success(decoded)
            } catch  {
                if let error = response.error {
                    self.result = LogInAPIResult<T>.failure(LogInAPIError(.unknown, errorMessage: error.localizedDescription))
                } else {
//                    fatalError()
                    self.result = .failure(.init(.unknown, errorMessage: "TEST"))
                }
            }
        } else {
//            fatalError()
            self.result = .failure(.init(.blahblah, errorMessage: "test"))
        }
    }
}

struct LogInAPIError: Error {
    private let errorType: CGNetwork.ErrorType
    private let errorMessage: String
    
    init(_ errorType: CGNetwork.ErrorType, errorMessage: String) {
        self.errorType = errorType
        self.errorMessage = errorMessage
    }
}

enum LogInAPIResult<T: Decodable> {
    case success(T)
    case failure(LogInAPIError)
}

