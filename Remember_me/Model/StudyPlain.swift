//
//  StudyPlain.swift
//  Remember_me
//
//  Created by Iranildo C. Silva on 11/03/20.
//  Copyright © 2020 Local Oeste Software House. All rights reserved.
//

import Foundation

class StudyPlain: Codable{
    let task: String
    let section: String
    let date: Date
    var done: Bool = false
    var id: String
    
    init (task: String, section: String, date: Date, done: Bool, id: String){
        
        self.task =  task
        self.section = section
        self.date = date
        self.done = done
        self.id = id
    }
    
    
    
    
    
    
}
