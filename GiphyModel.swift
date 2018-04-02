//
//  GiphyModel.swift
//  
//
//  Created by John He on 2018-04-02.
//
//

import Foundation

struct GiphyModel: Codable {
    let name: String
    let webPages: [String]?
    let country: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case webPages = "web_pages"
        case country
    }
    
    var description: String {
        get {
            if let webPage = webPages?.first {
                return "\(country) • \(webPage)"
            } else {
                return country
            }
        }
    }
}

struct fixed_height: Codable {
    let width, height, url: String
    
    enum CodingKeys : String, CodingKey {
        case width = "width"
        case height = "height"
        case url = "url"
    }
}
