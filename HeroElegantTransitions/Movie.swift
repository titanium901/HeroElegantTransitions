//
//  Movie.swift
//  HeroElegantTransitions
//
//  Created by Yury Popov on 21.10.2019.
//  Copyright © 2019 Iurii Popov. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    let name, realname, team, firstappearance: String
    let createdby, publisher: String
    let imageurl: String
    let bio: String
}
