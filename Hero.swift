//
//  Hero.swift
//  HeroTracker
//
//  Created by Timothy Hang on 3/27/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import Foundation

class Hero
{
  var name: String
  var homeworld: String
  var powers: String
  
  init (name: String, homeworld: String, powers: String)
  {
    self.name = name
    self.homeworld = homeworld
    self.powers = powers
  }
  
  init(heroDictionary: [String: Any])
  {
    self.name = heroDictionary["name"] as! String
    self.homeworld = heroDictionary["homeworld"] as! String
    self.powers = heroDictionary["powers"] as! String
  }
  
}
