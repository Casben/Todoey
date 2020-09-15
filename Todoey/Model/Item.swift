//
//  Item.swift
//  Todoey
//
//  Created by Herbert Dodge on 9/15/20.
//  Copyright © 2020 Herbert Dodge. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
