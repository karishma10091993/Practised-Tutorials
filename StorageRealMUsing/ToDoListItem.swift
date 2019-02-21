//
//  File.swift
//  StorageRealMUsing
//
//  Created by kireeti on 19/02/19.
//  Copyright © 2019 KireetiSoftSolutions. All rights reserved.
//



import Foundation
import RealmSwift

class ToDoListItem: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var done = false
    
}

