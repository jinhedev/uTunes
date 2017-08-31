//
//  WebServiceManager.swift
//  uTunes
//
//  Created by rightmeow on 8/30/17.
//  Copyright © 2017 Duckensburg. All rights reserved.
//

import Foundation

protocol WebServiceDelegate {
    func webServiceDidErr(error: Error)
    func webServiceDidFetchPosts(data: Data?, response: URLResponse?)
}

extension WebServiceDelegate {
    func webServiceDidFetchPosts(data: Data?, response: URLResponse?) {}
}

class WebServiceManager: NSObject {

    var delegate: WebServiceDelegate?

    private func createHTTPRequest(_ httpMethod: String, endpoint: String, header: [String : String]?, params: [String : String]?) -> URLRequest {
        guard let url = URL(string: WebServiceConfigurations.baseURL+endpoint) else {
            fatalError("failed to convert to URL")
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        if header != nil {
            request.allHTTPHeaderFields = header!
        }
        if params != nil {
            var body = String()
            for (key, value) in params! {
                body.append("\(key)=\(value)&")
            }
            request.httpBody = body.data(using: String.Encoding.utf8)
        }
        return request
    }

    // MARK: - GET

    func fetchPosts(httpMethod: String, endpoint: String, header: [String: String]?, params: [String: String]?) {
        let request = createHTTPRequest(httpMethod, endpoint: endpoint, header: header, params: params)
        URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if let err = error {
                self.delegate?.webServiceDidErr(error: err)
            } else {
                self.delegate?.webServiceDidFetchPosts(data: data, response: response)
            }
        }.resume()
    }

}

struct WebServiceConfigurations {

    static let baseURL = "https://itunes.apple.com"

    struct endpoint {
        static let search = "/search"
    }

    struct param {
        static let term = "term"
    }

    struct httpMethod {
        static let get = "get"
    }

}



























