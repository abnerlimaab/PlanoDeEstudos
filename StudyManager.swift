//
//  StudyManager.swift
//  PlanoDeEstudos
//
//  Created by Abner Lima on 21/05/23.
//  Copyright © 2023 Eric Brito. All rights reserved.
//

import Foundation

class StudyManager {
    static let shared = StudyManager()
    let ud = UserDefaults.standard
    var studyPlans: [StudyPlan] = []
    
    private init() {
        if let data = ud.data(forKey: CONFIG.UDKey),
           let plans = try? JSONDecoder().decode([StudyPlan].self, from: data) {
            self.studyPlans = plans
        }
    }
    
    func savePlans() {
        if let data = try? JSONEncoder().encode(studyPlans) {
            ud.set(data, forKey: CONFIG.UDKey)
        }
    }
    
    func addPlan(_ studyPlan: StudyPlan) {
        studyPlans.append(studyPlan)
        savePlans()
    }
    
    func removePlan(at index: Int) {
        studyPlans.remove(at: index)
        savePlans()
    }
}
