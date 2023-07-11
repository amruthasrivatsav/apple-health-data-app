//
//  RetrievalMethods.swift
//  appleHealthDataNew
//
//  Created by Amrutha Srivatsav on 6/18/23.
//

import Foundation
import HealthKit

class RetrievalMethods
{
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
    
    class func retrieveWorkoutMinutesData(completion: @escaping ([HKQuantitySample]?, Error?) -> Void) {
        let workoutType = HKObjectType.quantityType(forIdentifier: .appleExerciseTime)
        let predicate = HKQuery.predicateForSamples(withStart: nil, end: nil, options: .strictStartDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: workoutType!, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
            guard let workoutMinutesSamples = samples as? [HKQuantitySample], error == nil else {
                completion(nil, error)
                return
            }
            
            completion(workoutMinutesSamples, nil)
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

    class func retrieveDistWalkingRunning(completion: @escaping ([HKQuantitySample]?, Error?) -> Void) {
        let distWalkingRunningType = HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)
        let predicate = HKQuery.predicateForSamples(withStart: nil, end: nil, options: .strictStartDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: distWalkingRunningType!, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
            guard let flightsClimbedSamples = samples as? [HKQuantitySample], error == nil else {
                completion(nil, error)
                return
            }
            
            completion(flightsClimbedSamples, nil)
        }
        
        HKHealthStore().execute(query)
    }
    
    class func retrieveAppleExerciseTime(completion: @escaping ([HKQuantitySample]?, Error?) -> Void) {
        let exerciseTimeType = HKObjectType.quantityType(forIdentifier: .appleExerciseTime)
        let predicate = HKQuery.predicateForSamples(withStart: nil, end: nil, options: .strictStartDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: exerciseTimeType!, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
            guard let exerciseTimeSamples = samples as? [HKQuantitySample], error == nil else {
                completion(nil, error)
                return
            }
            
            completion(exerciseTimeSamples, nil)
        }
        
        HKHealthStore().execute(query)
    }
    
    class func retrieveAppleStandTime(completion: @escaping ([HKQuantitySample]?, Error?) -> Void) {
        let standTimeType = HKObjectType.quantityType(forIdentifier: .appleStandTime)
        let predicate = HKQuery.predicateForSamples(withStart: nil, end: nil, options: .strictStartDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: standTimeType!, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
            guard let standTimeSamples = samples as? [HKQuantitySample], error == nil else {
                completion(nil, error)
                return
            }
            
            completion(standTimeSamples, nil)
        }
        
        HKHealthStore().execute(query)
    }
    
    class func retrieveSleepAnalysis(completion: @escaping ([HKCategorySample]?, Error?) -> Void) {
        let sleepAnalysisType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis)
        let predicate = HKQuery.predicateForSamples(withStart: nil, end: nil, options: .strictStartDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: sleepAnalysisType!, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
            guard let sleepAnalysisSamples = samples as? [HKCategorySample], error == nil else {
                completion(nil, error)
                return
            }
            
            completion(sleepAnalysisSamples, nil)
        }
        
        HKHealthStore().execute(query)
    }
    
    class func retrieveRespiratoryRate(completion: @escaping ([HKQuantitySample]?, Error?) -> Void) {
        let respiratoryRateType = HKObjectType.quantityType(forIdentifier: .respiratoryRate)
        let predicate = HKQuery.predicateForSamples(withStart: nil, end: nil, options: .strictStartDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: respiratoryRateType!, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
            guard let respiratoryRateSamples = samples as? [HKQuantitySample], error == nil else {
                completion(nil, error)
                return
            }
            
            completion(respiratoryRateSamples, nil)
        }
        
        HKHealthStore().execute(query)
    }
    
    class func retrieveOxygenSaturationData(completion: @escaping ([HKQuantitySample]?, Error?) -> Void) {
        let oxygenSaturationType = HKObjectType.quantityType(forIdentifier: .oxygenSaturation)
        let predicate = HKQuery.predicateForSamples(withStart: nil, end: nil, options: .strictStartDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: oxygenSaturationType!, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
            guard let oxygenSaturationSamples = samples as? [HKQuantitySample], error == nil else {
                completion(nil, error)
                return
            }
            
            completion(oxygenSaturationSamples, nil)
        }
        
        HKHealthStore().execute(query)
    }
    
    class func retrieveHeartRateVariabilityData(completion: @escaping ([HKQuantitySample]?, Error?) -> Void) {
        let heartRateVariabilityType = HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN)
        let predicate = HKQuery.predicateForSamples(withStart: nil, end: nil, options: .strictStartDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: heartRateVariabilityType!, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
            guard let heartRateVariabilitySamples = samples as? [HKQuantitySample], error == nil else {
                completion(nil, error)
                return
            }
            
            completion(heartRateVariabilitySamples, nil)
        }
        
        HKHealthStore().execute(query)
    }
    
    class func retrieveHeartRateData(completion: @escaping ([HKQuantitySample]?, Error?) -> Void) {
        let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate)
        let predicate = HKQuery.predicateForSamples(withStart: nil, end: nil, options: .strictStartDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: heartRateType!, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
            guard let heartRateSamples = samples as? [HKQuantitySample], error == nil else {
                completion(nil, error)
                return
            }
            
            completion(heartRateSamples, nil)
        }
        
        HKHealthStore().execute(query)
    }
    
    class func retrieveRunningSpeedData(completion: @escaping ([HKQuantitySample]?, Error?) -> Void) {
        let runningSpeedType = HKObjectType.quantityType(forIdentifier: .runningSpeed)
        let predicate = HKQuery.predicateForSamples(withStart: nil, end: nil, options: .strictStartDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: runningSpeedType!, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
            guard let runningSpeedSamples = samples as? [HKQuantitySample], error == nil else {
                completion(nil, error)
                return
            }
            
            completion(runningSpeedSamples, nil)
        }
        
        HKHealthStore().execute(query)
    }
    
    class func retrieveWalkingSpeedData(completion: @escaping ([HKQuantitySample]?, Error?) -> Void) {
        let walkingSpeedType = HKObjectType.quantityType(forIdentifier: .walkingSpeed)
        let predicate = HKQuery.predicateForSamples(withStart: nil, end: nil, options: .strictStartDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: walkingSpeedType!, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
            guard let walkingSpeedSamples = samples as? [HKQuantitySample], error == nil else {
                completion(nil, error)
                return
            }
            
            completion(walkingSpeedSamples, nil)
        }
        
        HKHealthStore().execute(query)
    }
    
    class func retrieveWorkoutTypeData(completion: @escaping ([HKWorkout]?, Error?) -> Void) {
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
    
    
}
