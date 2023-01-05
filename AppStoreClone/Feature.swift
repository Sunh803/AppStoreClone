//
//  Feature.swift
//  AppStoreClone
//
//  Created by SunHo Lee on 2023/01/05.
//

import Foundation
struct Feature : Decodable {
    let type: String
    let appName: String
    let description : String
    let imageURL : String
}
