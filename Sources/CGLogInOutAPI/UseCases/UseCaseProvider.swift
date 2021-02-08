//
//  UseCaseProvider.swift
//  LogInOutAPI
//
//  Created by gyun on 2021/02/03.
//

import Foundation
import CGDomains

public enum LogInType {
    public enum Face {
        public final class UseCaseProvider: CGDomains.LogInOutUseCaseProvider {
            public init() {
                
            }
            public func makeLogOutUseCase() -> CGDomains.LogOutUseCase {
                LogOutUseCase()
            }
            
            public func makeLogInUseCase() -> CGDomains.LogInUseCase {
                FaceLogInUseCase(request: LogInOutNetworkProvier.login)
            }
        }
    }
}
