//
//  WorkoutManager.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 07/04/2024.
//

import HealthKit

class WorkoutManager {
    private let healthStore = HKHealthStore()
    
    func requestAuthorization(completion: @escaping (Bool, Error?) -> Void) {
        let typesToShare: Set = [HKObjectType.workoutType()]
        
        healthStore.requestAuthorization(toShare: typesToShare, read: nil) { success, error in
            completion(success, error)
        }
    }
}
