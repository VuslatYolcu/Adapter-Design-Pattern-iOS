//
//  YelpSearchService.swift
//  hello-maps
//
//  Created by Vuslat Yolcu on 30.03.2023.
//  Copyright © 2023 Mohammad Azam. All rights reserved.
//

import Foundation

class YelpSearchService: YelpSearchResults {
    
    func getBusinesses(completion: @escaping ([YelpBusiness]) -> ()) {
        if let path = Bundle.main.path(forResource: "yelp-business", ofType: "json") {
            
            if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) {
                
                guard let results = try? JSONDecoder().decode([YelpBusiness].self, from: jsonData) else {
                    completion([YelpBusiness]())
                    return
                }
                completion(results)
            }
        }
    }
    
}

extension YelpSearchService: SearchResultsProtocol {
    func adaptSearchResultsFromYelp(completion: @escaping (SearchResults) -> ()) {
        var businesses = [Business]()
        getBusinesses { yelpBusinesses in
            for business in yelpBusinesses {
                businesses.append(business.adaptBusinessFromYelp())
            }
            
            completion(SearchResults(business: businesses))
        }
    }
}
