//
//  APIHandlerController.swift
//  bookstore_catalogue_api
//
//  Created by Leo Nugraha on 2021/8/27.
//

import Foundation

enum APIError: Error {
    case responseProblem
    case decodingProblem
    case encodingProblem
}

class APIHandler {

    // MARK: Return the associated login credentials (access token) upon successful login
    public class func postLoginCredentials(username: String, password: String) -> String {
        // The return data type collected afterwards is access_token
        var access_code: String = ""
        let fullURL = LOGIN_API + "grant_type=\(grant_type)&username=\(username)&password=\(password)&client_id=\(client_id)&client_secret=\(client_secret)&scope=\(scope)"
        
        let url = URL(string: fullURL)
        var urlRequest: URLRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept-Encoding")
        
        // Add dispatch group here
        let semaphore = DispatchSemaphore(value: 0)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            let httpResponse = response as? HTTPURLResponse
            let statusCodeResponse = httpResponse?.statusCode
            if statusCodeResponse == 200 {

                guard let data = data else {
                    return
                }

                do {
                    let messageData = try JSONDecoder().decode(LoginModel.self, from: data)
                    access_code = messageData.access_token
                } catch let error as NSError {
                    print(error)
                } // end-do-catch
            } // end-if statusCodeResponse
            semaphore.signal()
        }
        dataTask.resume()
        semaphore.wait()
        return access_code
    }

    // MARK: Return how many stores and how many books sold in each store
    public class func getCataloguePage(access_token: String, completionHandler: @escaping( (Result<CatalogueModel,APIError>) -> Void )) {

        // Design a URL that will be appended with access_code
        let fullURL = CATALOGUE_API + "?access_token=\(access_token)"
        let url = URL(string: fullURL)

        do {
            var urlRequest: URLRequest = URLRequest(url: url!)
            urlRequest.httpMethod = "GET"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept-Encoding")

            let semaphore = DispatchSemaphore(value: 0)
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else {
                    completionHandler(.failure(.responseProblem))
                    return
                }

                do {
                    let messageData = try JSONDecoder().decode(CatalogueModel.self, from: jsonData)
                    completionHandler(.success(messageData))
                } catch {
                    completionHandler(.failure(.decodingProblem))
                }
                semaphore.signal()
            }
            dataTask.resume()
            semaphore.wait()
        } catch {
            completionHandler(.failure(.encodingProblem))
        }

    }

    // MARK: Return a list of books from a given store ID
    public class func getBookListSingleStore(access_token: String, storeId: String, completionHandler: @escaping( (Result<SingleStoreCatalogueModel,APIError>) -> Void)) {

        let fullURL = CATALOGUE_API + "\(storeId)?access_token=\(access_token)"
        let url = URL(string: fullURL)

        do {
            var urlRequest: URLRequest = URLRequest(url: url!)
            urlRequest.httpMethod = "GET"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept-Encoding")

            let semaphore = DispatchSemaphore(value: 0)
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else {
                    completionHandler(.failure(.responseProblem))
                    return
                }

                do {
                    let messageData = try JSONDecoder().decode(SingleStoreCatalogueModel.self, from: jsonData)
                    completionHandler(.success(messageData))
                } catch {
                    completionHandler(.failure(.decodingProblem))
                }
                semaphore.signal()
            }
            dataTask.resume()
            semaphore.wait()
        } catch {
            completionHandler(.failure(.encodingProblem))
        }

    }

    // MARK: Return a book image and description for each book
    public class func getProductDescription(access_token: String, bookId: String, completionHandler: @escaping( (Result<DescriptionModel,APIError>) -> Void)) {
        let fullURL = PRODUCT_API + "\(bookId)?access_token=\(access_token)"
        let url = URL(string: fullURL)
        do {
            var urlRequest: URLRequest = URLRequest(url: url!)
            urlRequest.httpMethod = "GET"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept-Encoding")

            let semaphore = DispatchSemaphore(value: 0)
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else {
                    completionHandler(.failure(.responseProblem))
                    return
                }

                do {
                    // let dataString = String(data: jsonData, encoding: String.Encoding.utf8)
                    // print(dataString)
                    let descriptionData = try JSONDecoder().decode(DescriptionModel.self, from: jsonData)
                    completionHandler(.success(descriptionData))
                } catch {
                    completionHandler(.failure(.decodingProblem))
                }
                semaphore.signal()

            }
            dataTask.resume()
            semaphore.wait()
        } catch {
            completionHandler(.failure(.encodingProblem))
        }

    }

}
