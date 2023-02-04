//
//  WebClientService.swift
//  Assignement_1
//
//  Created by user233573 on 2/1/23.
//

import Foundation

enum WebClientServiceErrors: Error{
    case URLFailer;
}


class WebClientService{
    
    public static func fetchData(from url_string: String) async throws -> Data{
        guard
            let url = URL(string: url_string)
        else{
            throw WebClientServiceErrors.URLFailer
        }
        let(data,_) = try await URLSession.shared.data(from: url)
        return data
    }
    
    
    
    
    
    
    
    
    
    
}
