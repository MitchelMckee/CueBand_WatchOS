//
//  HealthKitSetup.swift
//  CueBand Watch App
//
//  Created by Mitchel Mckee on 16/04/2024.
//

import Foundation
import HealthKit

class HealthKitManager: NSObject, ObservableObject, HKWorkoutSessionDelegate, HKLiveWorkoutBuilderDelegate {
    
    let health_store = HKHealthStore()

    var session: HKWorkoutSession?
    var builder: HKLiveWorkoutBuilder?
    
    func isHealthKitAvailable() -> Bool{
        return HKHealthStore.isHealthDataAvailable()
    }
    
    var hasRequestedAuthorisation: Bool {
            return UserDefaults.standard.bool(forKey: "HealthKitAuthorizationRequested")
        }
    
    func startWorkout(){
        let config = HKWorkoutConfiguration()
        config.activityType = .other
        config.locationType = .unknown
        
        do {
            session = try HKWorkoutSession(healthStore: health_store, configuration: config)
            session?.delegate = self
            builder = session?.associatedWorkoutBuilder()
            
            builder?.dataSource = HKLiveWorkoutDataSource(healthStore: health_store, workoutConfiguration: config)
            session?.startActivity(with: Date())
            builder?.beginCollection(withStart: Date()) { success, error in
                if let error = error {
                    print("Failed to start workout: \(error.localizedDescription)")
                }
            }
        } catch {
            print("Failed to start workout: \(error.localizedDescription)")
        }
    }
    
    func endWorkout(){
        session?.end()
  
        builder?.endCollection(withEnd: Date()) { (success, error) in
            if let error = error {
                print("Failed to end workout: \(error.localizedDescription)")
                return
                }
            }
        builder?.finishWorkout { workout, error in
            if let workout = workout {
                print("Workout finished: \(workout)")
            } else if let error = error {
                print("Error finishing workout: \(error.localizedDescription)")
            }
        }
    }
    
    func requestAuthorisation(completion: @escaping (Bool, Error?) -> Void){
        let typeToShare: Set = [HKQuantityType.workoutType()]
        let typeToRead: Set = [HKQuantityType.quantityType(forIdentifier: .walkingSpeed)!]

        health_store.requestAuthorization(toShare: typeToShare, read: typeToRead) {(success, error) in completion(success, error)
        }
    }
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didChangeTo toState: HKWorkoutSessionState, from fromState: HKWorkoutSessionState, date: Date) {
        print("Session state changed from \(fromState) to \(toState)")
    }
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: any Error) {
        print("Workout session failed with error: \(error)")
    }
    
    func workoutBuilder(_ workoutBuilder: HKLiveWorkoutBuilder, didCollectDataOf collectedTypes: Set<HKSampleType>) {
        print("Collected workout event")
    }
    
    func workoutBuilderDidCollectEvent(_ workoutBuilder: HKLiveWorkoutBuilder) {
        print("Workout builder did collect data.")
    }
    
    
}
