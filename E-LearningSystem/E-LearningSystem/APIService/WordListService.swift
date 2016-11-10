//
//  WordListService.swift
//  E-LearningSystem
//
//  Created by Phùng Tùng on 11/10/16.
//  Copyright © 2016 Ngo Sy Truong. All rights reserved.
//

import UIKit
import Alamofire
class WordListService: NSObject {
    func getWordList(perPage: String, token: String, success: ([[String: AnyObject]]) -> Void, failure: ([String: String]) -> Void) {
        let parameter = ["per_page": "1",
                         "auth_token": "3zUI4NvbrKhy48jqH8HEXw"]
        Alamofire.request(.GET, "https://manh-nt.herokuapp.com/words.json", parameters: parameter).responseJSON { response in
            if let JSON = response.result.value {
                print(JSON)
                guard let wordList = JSON["words"] as? [[String: AnyObject]] else {
                    if let message = JSON as? [String: String] {
                        failure(message)
                    } else {
                        failure(["message":"failed to get message"])
                    }
                    return
                }
                success(wordList)
            } else {
                failure(["message":"failed to get API"])
            }
        }
    }
    func dictionaryToObject (dicArr: [[String: AnyObject]]) -> [Word] {
        var wordList: [Word] = [Word]()
        wordList.append(Word(idWord: "asd", content: "asdasd", isCorrect: "asdasd"))
        return wordList
    }
}
