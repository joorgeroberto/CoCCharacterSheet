//
//  Character.swift
//  CoCCharacterSheet
//
//  Created by Jorge Roberto on 16/06/21.
//

import Foundation

class Character {
    var name: String;
    var level: Int;
    var className: String;
    var image: String;
    
    init(image: String, name: String, className: String, level: Int) {
        self.image = image
        self.name = name
        self.className = className
        self.level = level
    }
}
