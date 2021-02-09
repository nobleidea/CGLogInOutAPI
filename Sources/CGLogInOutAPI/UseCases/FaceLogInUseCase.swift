//
//  FaceLogInUseCase.swift
//  LogInOutAPI
//
//  Created by gyun on 2021/02/03.
//

import Foundation
import CGDomains

final class FaceLogInUseCase: CGDomains.LogInUseCase {
    private let request: LogInAPIRequest<LogIn>
    
    init(request: LogInAPIRequest<LogIn>) {
        self.request = request
    }
    
    func login(parameters: Dictionary<String, Any>, completion: @escaping ((LogIn?, Error?) -> Void)) {
        request.observer { response in
            switch response.result {
            case .success(let logIn):
                completion(logIn, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }.observer { _ in
            
        }.observer { _ in
            
        }.send(parameters: parameters)
    }
}
