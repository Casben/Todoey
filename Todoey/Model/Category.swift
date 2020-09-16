//
//  Category.swift
//  Todoey
//
//  Created by Herbert Dodge on 9/15/20.
//  Copyright © 2020 Herbert Dodge. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var backgroundColor: String = ""
    let items = List<Item>()
}
