//
//  StudyManager.swift
//  Remember_me
//
//  Created by Iranildo C. Silva on 11/03/20.
//  Copyright © 2020 Local Oeste Software House. All rights reserved.
//

import Foundation
class StudyManager{
    
    
    static let shared = StudyManager()
    let ud = UserDefaults.standard
    var studyPlans: [StudyPlain] = []
    
    
    private init(){
        if let data = ud.data(forKey: "studyPlans"), let plans = try?
            JSONDecoder().decode([StudyPlain].self, from: data){
            self.studyPlans = plans
        }
    }
    
    
    func savePlans(){
        if let data = try? JSONEncoder().encode(studyPlans){
            ud.set(data, forKey: "studyPlans")
        }
    }
    
    func addPlan(_ studyPlan: StudyPlain){
        studyPlans.append(studyPlan)
        savePlans()
    }
    
    func removePlan(at index: Int){
        studyPlans.remove(at: index)
        savePlans()
    }
    
    
}

