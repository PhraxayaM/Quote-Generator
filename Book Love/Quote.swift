//
//  Quote.swift
//  Book Love
//
//  Created by MattHew Phraxayavong on 5/14/19.
//  Copyright © 2019 Matthew Phraxayavong. All rights reserved.
//

import Foundation

struct Quote {
    let quotetext: String
    let quoteauthor: String
    
    init(quote: String, author: String) {
        self.quotetext = quote
        self.quoteauthor = author
    }
}

