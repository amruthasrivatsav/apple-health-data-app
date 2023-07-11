//
//  PermissionHealthKitSetup.swift
//  appleHealthDataNew
//
//  Created by Amrutha Srivatsav on 6/14/23.
//

import Foundation
import HealthKit

class PermissionFull
{
    private enum PermissionHealthKitError: Error
    {
        case deviceNotAvailable
        case dataNotAvailable
    }
    
    class func authorizedHealthKitSetup(completion: @escaping (Bool, Error?) -> Void)
    {
        guard HKHealthStore.isHealthDataAvailable() else
        {
            completion(false,PermissionHealthKitError.deviceNotAvailable)
            return
        }
        
        guard let dateOfBirth = HKObjectType.characteristicType(forIdentifier: .dateOfBirth),
              let bloodType = HKObjectType.characteristicType(forIdentifier: .bloodType),
              let biologicalSex = HKObjectType.characteristicType(forIdentifier: .biologicalSex),
              let stepCount = HKObjectType.quantityType(forIdentifier: .stepCount),
              let flightsClimbed = HKObjectType.quantityType(forIdentifier: .flightsClimbed),
              let distanceWalkingRunning = HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning),
              let appleExerciseTime = HKObjectType.quantityType(forIdentifier: .appleExerciseTime),
              let appleStandTime = HKObjectType.quantityType(forIdentifier: .appleStandTime),
              let sleepAnalysis = HKObjectType.categoryType(forIdentifier: .sleepAnalysis),
              let respiratoryRate = HKObjectType.quantityType(forIdentifier: .respiratoryRate),
              let oxygenSaturation = HKObjectType.quantityType(forIdentifier: .oxygenSaturation),
              let heartRateVariabilitySDNN = HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN),
              let heartRate = HKObjectType.quantityType(forIdentifier: .heartRate),
              let runningSpeed = HKObjectType.quantityType(forIdentifier: .runningSpeed),
              let walkingSpeed = HKObjectType.quantityType(forIdentifier: .walkingSpeed)
        else {
            completion(false, PermissionHealthKitError.dataNotAvailable)
            return
        }
        let workoutType = HKObjectType.workoutType()
        let hkHealthKitToReadDataType: Set<HKObjectType> = [
            dateOfBirth,
            dateOfBirth,
            bloodType,
            biologicalSex,
            stepCount,
            flightsClimbed,
            distanceWalkingRunning,
            appleExerciseTime,
            appleStandTime,
            sleepAnalysis,
            respiratoryRate,
            oxygenSaturation,
            heartRateVariabilitySDNN,
            heartRate,
            runningSpeed,
            walkingSpeed,
            workoutType
        ]
        HKHealthStore().requestAuthorization(toShare: nil, read: hkHealthKitToReadDataType) {(success, error) in
            completion(success,error)
        }
    }
    
    class func retrieveAllWorkoutData(completion: @escaping ([HKWorkout]?, Error?) -> Void) {
        let workoutType = HKObjectType.workoutType()
        
        let predicate = HKQuery.predicateForSamples(withStart: nil, end: nil, options: .strictStartDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: workoutType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
            guard let workouts = samples as? [HKWorkout], error == nil else {
                completion(nil, error)
                return
            }
            
            completion(workouts, nil)
        }
        
        HKHealthStore().execute(query)
    }
    
    class func retrieveStepCountData(completion: @escaping ([HKQuantitySample]?, Error?) -> Void) {
         let stepCountType = HKObjectType.quantityType(forIdentifier: .stepCount)
         let predicate = HKQuery.predicateForSamples(withStart: nil, end: nil, options: .strictStartDate)
         let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)

         let query = HKSampleQuery(sampleType: stepCountType!, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
             guard let stepCountSamples = samples as? [HKQuantitySample], error == nil else {
                 completion(nil, error)
                 return
             }

             completion(stepCountSamples, nil)
         }

         HKHealthStore().execute(query)
     }

    class func retrieveFlightsClimbedData(completion: @escaping ([HKQuantitySample]?, Error?) -> Void) {
        let flightsClimbedType = HKObjectType.quantityType(forIdentifier: .flightsClimbed)
        let predicate = HKQuery.predicateForSamples(withStart: nil, end: nil, options: .strictStartDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)

        let query = HKSampleQuery(sampleType: flightsClimbedType!, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
            guard let flightsClimbedSamples = samples as? [HKQuantitySample], error == nil else {
                completion(nil, error)
                return
            }

            completion(flightsClimbedSamples, nil)
        }

        HKHealthStore().execute(query)
    }
    
    

}
