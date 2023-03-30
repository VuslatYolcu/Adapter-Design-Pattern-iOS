//
//  Protocols.swift
//  hello-maps
//
//  Created by Mohammad Azam on 9/13/18.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

import Foundation

// this is third party model provided to you by third party
protocol YelpSearchResults {
    func getBusinesses(completion :@escaping ([YelpBusiness]) -> ())
}

protocol SearchResultsProtocol {
    func adaptSearchResultsFromYelp(completion: @escaping (SearchResults) -> ())
}

struct SearchResults {
    var business: [Business]
}

protocol BusinessProtocol {
    func adaptBusinessFromYelp() -> Business
}
