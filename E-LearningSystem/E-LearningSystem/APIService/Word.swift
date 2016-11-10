//
//  Word.swift
//  E-LearningSystem
//
//  Created by Phùng Tùng on 11/10/16.
//  Copyright © 2016 Ngo Sy Truong. All rights reserved.
//

import UIKit

class Word {
    
    var idWord: String
    var content: String
    var isCorrect: String
    
    init(idWord: String, content: String, isCorrect: String) {
        self.idWord = idWord
        self.content = content
        self.isCorrect = isCorrect
    }

}
