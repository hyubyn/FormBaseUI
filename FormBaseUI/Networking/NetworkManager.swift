//
//  NetworkManager.swift
//  wbea
//
//  Created by Hyubyn on 18/04/2022.
//

import Foundation

struct NetworkManager {
    static let shared = NetworkManager()
    private let session = URLSession.shared

    func sendRequest(urlRequest: URLRequest, completionBlock: @escaping (Result<Data, Error>) -> Void) {
        WLogs.log(urlRequest.curlString)
        session.dataTask(with: urlRequest) { (data, urlResponse, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completionBlock(.failure(error))
                } else if let data = data {
                    WLogs.log("Data responded: \(String(data: data, encoding: .utf8) ?? "Request successful with result: nil")")
                    completionBlock(.success(data))
                } else {
                    completionBlock(.failure(NSError(domain: "com.vog.wbea", code: 404)))
                }
            }
        }.resume()
    }

    func sendJsonResultRequest<T: Decodable>(urlRequest: URLRequest, result: @escaping (Result<T, Error>) -> Void) {
        sendRequest(urlRequest: urlRequest) { (response) in
            switch response {
            case .success(let data):
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    result(.success(model))
                } catch let error {
                    WLogs.log("Decode failed with error: \(error.localizedDescription)")
                    result(.failure(error))
                }
            case .failure(let error):
                result(.failure(error))
            }
        }
    }

    func buildQueryString(fromDictionary parameters: [String: String]) -> String {
        var urlVars: [String] = []
        for (key, value) in parameters {
            let encodedValue = value.addPercentEncoding()
            urlVars.append(key + "=" + encodedValue)
        }

        return urlVars.isEmpty ? "" : "?" + urlVars.joined(separator: "&")
    }
}
