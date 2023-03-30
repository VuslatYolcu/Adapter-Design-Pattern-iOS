//
//  YelpBusiness.swift
//  hello-maps
//
//  Created by Mohammad Azam on 9/13/18.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

// this is third party model provided to you by third party

import Foundation
import CoreLocation

struct YelpBusiness :Decodable {
    
    var title :String
    var latitude :Double
    var longitude :Double
    var rating :Double
    
}

extension YelpBusiness: BusinessProtocol {
    func adaptBusinessFromYelp() -> Business {
        let location = CLLocation(latitude: self.latitude, longitude: self.longitude)
        return Business(name: self.title, location: location, rating: self.rating)
    }
}
