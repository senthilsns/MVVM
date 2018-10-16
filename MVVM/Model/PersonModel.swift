//
//  PersonModel.swift
//  MVVM
//
//  Created by SENTHIL on 16/10/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import UIKit

class personModel: Codable {
    
    var name : String?
    var company : String?

    enum CodingKeys: String, CodingKey {
        case name
        case company
    }
}
