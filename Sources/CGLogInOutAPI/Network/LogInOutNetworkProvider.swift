//
//  LogInNetworkProvider.swift
//  LogInOutAPI
//
//  Created by gyun on 2021/02/03.
//

import Foundation
import CGDomains
import CGNetwork

enum LogInOutNetworkProvier {
    
    static var login: LogInAPIRequest<LogIn> {
        let network = Network(host: CGDomains.Host.logInOutHost, path: CGDomains.Path.logIn, httpMethod: "POST")
        return LogInAPIRequest<LogIn>(network: network)
    }
    
    static var logout: LogOutAPIRequest<LogOut> {
        let network = Network(host: CGDomains.Host.logInOutHost, path: CGDomains.Path.logOut, httpMethod: "POST")
        return LogOutAPIRequest(network: network)
    }
    
}
