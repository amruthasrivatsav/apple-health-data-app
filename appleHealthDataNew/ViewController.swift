//
//  ViewController.swift
//  appleHealthDataNew
//
//  Created by Amrutha Srivatsav on 6/14/23.
//

import UIKit
import HealthKit

class ViewController: UIViewController {
    

    @IBOutlet weak var authorizeButton: UIButton!
    

    
    var formattedData: [[String]] =  []

    override func viewDidLoad() {
        super.viewDidLoad()
        authorizeButton.addTarget(self, action: #selector(openPermissionSetup), for: .touchUpInside)
        authorizeButton.layer.cornerRadius = 12
       
    }

    
    

    @objc func openPermissionSetup() {
        self.formattedData = initializeDataTable()
        
        let dispatchGroup = DispatchGroup()
        
        PermissionHealthKitSetup.authorizedHealthKitSetup { (authorize, error) in
            guard authorize else{
                let message = "authorized failed"
                if let error = error{
                    print("\(message) reason \(error)")
                }else{
                    print(message)
                }
                return
            }
            print("Healthkit Authorized Successful")
        }
        
        
        DispatchQueue.main.async {
//            self.formattedData.append(contentsOf: self.initializeDataTable())
//
//            let dispatchGroup = DispatchGroup()
            
            dispatchGroup.enter()
            RetrievalMethods.retrieveStepCountData { (stepCountSamples, error) in
                if let stepCountSamples = stepCountSamples {
                    let stepCountData = self.formatHealthData(stepCountSamples, name: "StepCount", units: HKUnit.count())
                    print("printing step count")
                    self.formattedData.append(contentsOf: stepCountData)
                } else if let error = error {
                    print("Error retrieving step count data: \(error)")
                }
                dispatchGroup.leave()
            }
            
            dispatchGroup.enter()
            RetrievalMethods.retrieveFlightsClimbedData { (flightsClimbedSamples, error) in
                if let flightsClimbedSamples = flightsClimbedSamples {
                    let flightsClimbedData = self.formatHealthData(flightsClimbedSamples, name: "Flights Climbed", units: HKUnit.count())
                    print("printing flight climbed")
                    self.formattedData.append(contentsOf: flightsClimbedData)
                } else if let error = error {
                    print("Error retrieving flights climbed data: \(error)")
                }
                dispatchGroup.leave()
            }
            
            dispatchGroup.enter()
            RetrievalMethods.retrieveDistWalkingRunning { (distWalkingRunningSamples, error) in
                if let distWalkingRunningSamples = distWalkingRunningSamples {
                    let distWalkingRunning = self.formatHealthData(distWalkingRunningSamples, name: "Distance Walking/Running", units: HKUnit.meter(), conversion: 1609.34)
                    print("printing walking running distance")
                    self.formattedData.append(contentsOf: distWalkingRunning)
                } else if let error = error {
                    print("Error retrieving distance walking/running data: \(error)")
                }
                dispatchGroup.leave()
            }

            dispatchGroup.enter()
            RetrievalMethods.retrieveAppleExerciseTime { (appleExerciseTimeSamples, error) in
                if let appleExerciseTimeSamples = appleExerciseTimeSamples {
                    let excerciseTime = self.formatHealthData(appleExerciseTimeSamples, name: "Exercise Time", units: HKUnit.second())
                    print("printing apple excercise time")

                    self.formattedData.append(contentsOf: excerciseTime)
                } else if let error = error {
                    print("Error retrieving distance exercise time data: \(error)")
                }
                dispatchGroup.leave()
            }

            dispatchGroup.enter()
            RetrievalMethods.retrieveAppleStandTime { (appleStandTimeSamples, error) in
                if let appleStandTimeSamples = appleStandTimeSamples {
                    let standTime = self.formatHealthData(appleStandTimeSamples, name: "Stand Time", units: HKUnit.second())
                    
                    let chunkSize = 100
                    var index = 0

                    while index < standTime.count {
                        let endIndex = min(index + chunkSize, standTime.count)
                        let chunk = Array(standTime[index..<endIndex])
                        self.formattedData.append(contentsOf: chunk)
                        index += chunkSize
                    }
                    
                } else if let error = error {
                    print("Error retrieving stand time data: \(error)")
                }
                dispatchGroup.leave()
            }
            
            dispatchGroup.enter()
            RetrievalMethods.retrieveRespiratoryRate { (respiratoryRateSamples, error) in
                if let respiratoryRateSamples = respiratoryRateSamples {
                    let respiratoryRate = self.formatHealthData(respiratoryRateSamples, name: "Respiratory Rate", units: HKUnit.count().unitDivided(by: .minute()))
                    
                    let chunkSize = 100
                    var index = 0

                    while index < respiratoryRate.count {
                        let endIndex = min(index + chunkSize, respiratoryRate.count)
                        let chunk = Array(respiratoryRate[index..<endIndex])
                        self.formattedData.append(contentsOf: chunk)
                        index += chunkSize
                    }
                    
                } else if let error = error {
                    print("Error retrieving respiratory rate data: \(error)")
                }
                dispatchGroup.leave()
            }
            
            dispatchGroup.enter()
            RetrievalMethods.retrieveOxygenSaturationData { (oxygenSaturationSamples, error) in
                if let oxygenSaturationSamples = oxygenSaturationSamples {
                    let oxygenSaturation = self.formatHealthData(oxygenSaturationSamples, name: "Oxygen Saturation", units: HKUnit.percent())
                    
                    let chunkSize = 100
                    var index = 0

                    while index < oxygenSaturation.count {
                        let endIndex = min(index + chunkSize, oxygenSaturation.count)
                        let chunk = Array(oxygenSaturation[index..<endIndex])
                        self.formattedData.append(contentsOf: chunk)
                        index += chunkSize
                    }
                    
                } else if let error = error {
                    print("Error retrieving oxygen saturation data: \(error)")
                }
                dispatchGroup.leave()
            }
            
            dispatchGroup.enter()
            RetrievalMethods.retrieveHeartRateVariabilityData { (heartRateVariabilityDataSamples, error) in
                if let heartRateVariabilityDataSamples = heartRateVariabilityDataSamples {
                    let heartRateVariabilityData = self.formatHealthData(heartRateVariabilityDataSamples, name: "Heart Rate SDNN", units: HKUnit.secondUnit(with: .milli))
                    
                    let chunkSize = 100
                    var index = 0

                    while index < heartRateVariabilityData.count {
                        let endIndex = min(index + chunkSize, heartRateVariabilityData.count)
                        let chunk = Array(heartRateVariabilityData[index..<endIndex])
                        self.formattedData.append(contentsOf: chunk)
                        index += chunkSize
                    }
                    
                } else if let error = error {
                    print("Error retrieving heart rate SDNN data: \(error)")
                }
                dispatchGroup.leave()
            }
            
            dispatchGroup.enter()
            RetrievalMethods.retrieveHeartRateData { (heartRateSamples, error) in
                if let heartRateSamples = heartRateSamples {
                    let heartRateData = self.formatHealthData(heartRateSamples, name: "Heart Rate", units: HKUnit.count().unitDivided(by: .minute()))
                    
                    let chunkSize = 100
                    var index = 0

                    while index < heartRateData.count {
                        let endIndex = min(index + chunkSize, heartRateData.count)
                        let chunk = Array(heartRateData[index..<endIndex])
                        self.formattedData.append(contentsOf: chunk)
                        index += chunkSize
                    }
                    
                } else if let error = error {
                    print("Error retrieving heart rate data: \(error)")
                }
                dispatchGroup.leave()
            }
            
            dispatchGroup.enter()
            RetrievalMethods.retrieveRunningSpeedData { (runningSpeedSamples, error) in
                if let runningSpeedSamples = runningSpeedSamples {
                    let runningSpeedData = self.formatHealthData(runningSpeedSamples, name: "Running Speed", units: HKUnit.meter().unitDivided(by: .second()))
                    
                    let chunkSize = 100
                    var index = 0

                    while index < runningSpeedData.count {
                        let endIndex = min(index + chunkSize, runningSpeedData.count)
                        let chunk = Array(runningSpeedData[index..<endIndex])
                        self.formattedData.append(contentsOf: chunk)
                        index += chunkSize
                    }
                    
                } else if let error = error {
                    print("Error retrieving running speed data: \(error)")
                }
                dispatchGroup.leave()
            }
            
            dispatchGroup.enter()
            RetrievalMethods.retrieveWalkingSpeedData { (walkingSpeedSamples, error) in
                if let walkingSpeedSamples = walkingSpeedSamples {
                    let walkingSpeedData = self.formatHealthData(walkingSpeedSamples, name: "Walking Speed", units: HKUnit.mile().unitDivided(by: .hour()))
                    
                    let chunkSize = 100
                    var index = 0

                    while index < walkingSpeedData.count {
                        let endIndex = min(index + chunkSize, walkingSpeedData.count)
                        let chunk = Array(walkingSpeedData[index..<endIndex])
                        self.formattedData.append(contentsOf: chunk)
                        index += chunkSize
                    }
                    
                } else if let error = error {
                    print("Error retrieving walking speed data: \(error)")
                }
                dispatchGroup.leave()
            }
            
            
            
        
            dispatchGroup.notify(queue: .main) {
                self.saveFormattedData()
            }
        }

        // Call the retrieval methods
        
        }
    
    
    
    private func initializeDataTable() -> [[String]]  {
        var formattedData: [[String]] = []
        
        // Add header row with column names
        let headerRow = ["Metric Name", "Month Average", "Month Median", "Month Maximum", "Month Minimum", "Year Average", "Year Median", "Year Maximum", "Year Minimum",  "Week Average", "Week Median", "Week Maximum", "Week Minimum", "Overall Average", "Overall Median", "Overall Maximum", "Overall Minimum", "Week-Sum Average", "Week-Sum Min", "Week-Sum Max", "Month-Sum Average", "Month-Sum Min", "Month-Sum Max"]
        formattedData.append(headerRow)

        
        return formattedData
    }
    
    private func formatHealthData(_ samples: [HKQuantitySample],  name: String, units: HKUnit, conversion: Double = 1.0) -> [[String]] {
        var currentData: [[String]] =  []
        
        let monthlyAverage = MetricsCalc.getAverage(from: samples, unit: units, days: 30)/conversion
        let monthlyMedian = MetricsCalc.getMed(from: samples, unit: units, days: 30)/conversion
        let monthlyMax = MetricsCalc.getMax(from: samples, unit: units, days: 30)/conversion
        let monthlyMin = MetricsCalc.getMin(from: samples, unit: units, days: 30)/conversion
        let yearAverage = MetricsCalc.getAverage(from: samples, unit: units, days: 365)/conversion
        let yearMedian = MetricsCalc.getMed(from: samples, unit: units, days: 365)/conversion
        let yearMaximum = MetricsCalc.getMax(from: samples, unit: units, days: 365)/conversion
        let yearMinimum = MetricsCalc.getMin(from: samples, unit: units, days: 365)/conversion
        let weekAverage = MetricsCalc.getAverage(from: samples, unit: units, days: 7)/conversion
        let weekMedian = MetricsCalc.getMed(from: samples, unit: units, days: 7)/conversion
        let weekMax = MetricsCalc.getMax(from: samples, unit: units, days: 7)/conversion
        let weekMin = MetricsCalc.getMin(from: samples, unit: units, days: 7)/conversion
        let overallMin = MetricsCalc.calculateOverallMin(from: samples, unit: units)/conversion
        let overallMax = MetricsCalc.calculateOverallMaximum(from: samples, unit: units)/conversion
        let overallAverage = MetricsCalc.calculateOverallAverage(from: samples, unit: units)/conversion
        let overallMedian = MetricsCalc.calculateOverallMed(from: samples, unit: units)/conversion
        let weekSumAverage = MetricsCalc.calculateWeekSumAverage(from: samples, unit: units)/conversion
        let weekSumMinimum = MetricsCalc.calculateWeekSumMin(from: samples, unit: units)/conversion
        let weekSumMaximum = MetricsCalc.calculateWeekSumMax(from: samples, unit: units)/conversion
        let monthSumAverage = MetricsCalc.calculateMonthSumAverage(from: samples, unit: units)/conversion
        let monthSumMinimum = MetricsCalc.calculateMonthSumMinimum(from: samples, unit: units)/conversion
        let monthSumMaximum = MetricsCalc.calculateMonthSumMaximum(from: samples, unit: units)/conversion
        
        
        let averageDataRow = [String(name), String(monthlyAverage), String(monthlyMedian), String(monthlyMax), String(monthlyMin), String(yearAverage), String(yearMedian), String(yearMaximum), String(yearMinimum), String(weekAverage), String(weekMedian), String(weekMax), String(weekMin), String(overallAverage), String(overallMedian), String(overallMax), String(overallMin), String(weekSumAverage), String(weekSumMinimum), String(weekSumMaximum), String(monthSumAverage), String(monthSumMinimum), String(monthSumMaximum)]
        currentData.append(averageDataRow)
        
//        for (startDate, samples) in weekSumMaximum {
//            let calendar = Calendar.current // Define the calendar variable in the current scope
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "MMM d, yyyy"
//            if let startDate = calendar.date(from: startDate) {
//                let startDateString = dateFormatter.string(from: startDate)
//                print("Start Date: \(startDateString)")
//                for sample in samples {
//                    // Print the details of each sample
//                    print("Sample: \(sample)")
//                }
//                print("--------------------")
//            }
//
//        }
        return currentData

    }

    
    private func saveFormattedData() {
        let csvString = CSVExporter.convertToCSVString(data: self.formattedData)
        CSVExporter.saveCSVFile(csvString: csvString, fileName: "health_data.csv", viewController: self)
    }
    
}

