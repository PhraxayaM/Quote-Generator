//
//  NetworkManager.swift
//  Book Love
//
//  Created by MattHew Phraxayavong on 5/14/19.
//  Copyright © 2019 Matthew Phraxayavong. All rights reserved.
//

import Foundation

class NetworkManager {

    var url = "https://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=en&json=?"

    
    func getRandomQuote(completion: @escaping (Quote) -> ()) {
        
        
        
        // Set method to .default session
        let defaultSession = URLSession(configuration: .default)
        
        // Create URL
        let baseURL = URL(string: url)
        
        // Create Request
        let request = URLRequest(url: baseURL!)
        
        // Create Data Task
        let dataTask = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) in
            var quote: Quote!
            if let error = error {
                print(error)
                return
            }
            
            // protect against no data returned from HTTP response
            guard data != nil else {
                print("No data object")
                return
            }
            
            // Convert response data to JSON
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
                guard let author = jsonObject["quoteAuthor"] else {return}
                guard let quoteText = jsonObject["quoteText"] else {return}
                print("the author is \(author)")
                print("the quote is \(quoteText)")
                let newQuote = Quote(quote: quoteText as! String, author: author as! String)
                quote = newQuote
            } catch {
                print("JSON Error: \(error.localizedDescription)")
            }
            completion(quote)
        })
        
        dataTask.resume()
        
    }
    
    
    
//    func someDataFetchFunction() {
//
//        // Configure a .default session
//        let defaultSession = URLSession(configuration: .default)
//
//        // Create URL
//        let url = URL(string: "https://<your_target_web_service>")
//
//        // Create Request
//        let request = URLRequest(url: url!)
//
//        // Create Data Task
//        let dataTask = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
//
//            // handle Response Here
//
//        })
//        dataTask.resume() // Start the data task
//    }
}
