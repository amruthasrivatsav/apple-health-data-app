import Foundation
import HealthKit

extension Array where Element == Double {
    func median() -> Double? {
        guard !isEmpty else {
            return nil
        }
        
        let sortedArray = self.sorted()
        let middle = sortedArray.count / 2
        
        if sortedArray.count % 2 == 0 {
            return (sortedArray[middle - 1] + sortedArray[middle]) / 2.0
        } else {
            return sortedArray[middle]
        }
    }
}

class MetricsCalc {
//    static func calculateMonthMedian(from samples: [HKQuantitySample], unit: HKUnit) -> Double {
//        let calendar = Calendar.current
//        let now = Date()
//        let oneMonthAgo = calendar.date(byAdding: .month, value: -1, to: now)!
//        let monthSamples = samples.filter { calendar.isDate($0.startDate, inSameDayAs: oneMonthAgo) || $0.startDate > oneMonthAgo }
//
//        // Group the samples by day
//        let groupedSamples = Dictionary(grouping: monthSamples) { sample in
//            calendar.startOfDay(for: sample.startDate)
//        }
//
//        // Calculate the values for each day
//        let dailyValues = groupedSamples.mapValues { samples in
//            samples.map { sample in
//                sample.quantity.doubleValue(for: unit)
//            }
//        }
//
//        // Calculate the median value
//        let median = dailyValues.values.flatMap { $0 }.median() ?? 0.0
//        return median
//    }
    
    
//    static func calculateMonthAverage(from samples: [HKQuantitySample], unit: HKUnit) -> Double {
//        let calendar = Calendar.current
//        let now = Date()
//        let oneMonthAgo = calendar.date(byAdding: .month, value: -1, to: now)!
//        let monthSamples = samples.filter { calendar.isDate($0.startDate, inSameDayAs: oneMonthAgo) || $0.startDate > oneMonthAgo }
//
//        // Group the samples by day
//        let groupedSamples = Dictionary(grouping: monthSamples) { sample in
//            calendar.startOfDay(for: sample.startDate)
//        }
//
//        // Calculate the sum of values for each day
//        let dailySums = groupedSamples.mapValues { samples in
//            samples.reduce(0.0) { sum, sample in
//                sum + sample.quantity.doubleValue(for: unit)
//            }
//        }
//
//        // Calculate the average value excluding days with zero sum
//        let nonZeroSums = dailySums.values.filter { $0 > 0.0 }
//        let average = nonZeroSums.reduce(0.0, +) / Double(nonZeroSums.count)
//        return average
//    }
    
//    static func calculateMonthMax(from samples: [HKQuantitySample], unit: HKUnit) -> Double {
//        let calendar = Calendar.current
//        let now = Date()
//        let oneMonthAgo = calendar.date(byAdding: .month, value: -1, to: now)!
//        let monthSamples = samples.filter { calendar.isDate($0.startDate, inSameDayAs: oneMonthAgo) || $0.startDate > oneMonthAgo }
//
//        // Group the samples by day
//        let groupedSamples = Dictionary(grouping: monthSamples) { sample in
//            calendar.startOfDay(for: sample.startDate)
//        }
//
//        // Calculate the sum of values for each day
//        let dailySums = groupedSamples.mapValues { samples in
//            samples.reduce(0.0) { sum, sample in
//                sum + sample.quantity.doubleValue(for: unit)
//            }
//        }
//
//        // Get the minimum value
//        let maxSum = dailySums.values.max() ?? 0.0
//        return maxSum
//    }
    
    
    
//    static func calculateMonthMin(from samples: [HKQuantitySample], unit: HKUnit) -> Double { // Filter samples for the past month
//        let calendar = Calendar.current
//        let now = Date()
//        let oneMonthAgo = calendar.date(byAdding: .month, value: -1, to: now)!
//        let monthSamples = samples.filter { calendar.isDate($0.startDate, inSameDayAs: oneMonthAgo) || $0.startDate > oneMonthAgo }
//
//        // Group the samples by day
//        let groupedSamples = Dictionary(grouping: monthSamples) { sample in
//            calendar.startOfDay(for: sample.startDate)
//        }
//
//        // Calculate the sum of values for each day
//        let dailySums = groupedSamples.mapValues { samples in
//            samples.reduce(0.0) { sum, sample in
//                sum + sample.quantity.doubleValue(for: unit)
//            }
//        }
//
//        // Get the minimum value
//        let minSum = dailySums.values.min() ?? 0.0
//        return minSum
//    }
    
//    static func calculateWeekMinimum(from samples: [HKQuantitySample], unit: HKUnit) -> Double {
//        let calendar = Calendar.current
//        let now = Date()
//        let oneWeekAgo = calendar.date(byAdding: .day, value: -7, to: now)!
//        let weekSamples = samples.filter { calendar.isDate($0.startDate, inSameDayAs: oneWeekAgo) || $0.startDate > oneWeekAgo }
//
//        // Group the samples by day
//        let groupedSamples = Dictionary(grouping: weekSamples) { sample in
//            calendar.startOfDay(for: sample.startDate)
//        }
//
//        // Calculate the sum of values for each day
//        let dailySums = groupedSamples.mapValues { samples in
//            samples.reduce(0.0) { sum, sample in
//                sum + sample.quantity.doubleValue(for: unit)
//            }
//        }
//
//        // Get the minimum sum of values for the week
//        let minSum = dailySums.values.min() ?? 0.0
//        return minSum
//    }
    
//    static func calculateWeekMaximum(from samples: [HKQuantitySample], unit: HKUnit) -> Double {
//        let calendar = Calendar.current
//        let now = Date()
//        let oneWeekAgo = calendar.date(byAdding: .day, value: -7, to: now)!
//        let weekSamples = samples.filter { calendar.isDate($0.startDate, inSameDayAs: oneWeekAgo) || $0.startDate > oneWeekAgo }
//
//        // Group the samples by day
//        let groupedSamples = Dictionary(grouping: weekSamples) { sample in
//            calendar.startOfDay(for: sample.startDate)
//        }
//
//        // Calculate the sum of values for each day
//        let dailySums = groupedSamples.mapValues { samples in
//            samples.reduce(0.0) { sum, sample in
//                sum + sample.quantity.doubleValue(for: unit)
//            }
//        }
//
//        // Get the maximum sum of values for the week
//        let maxSum = dailySums.values.max() ?? 0.0
//        return maxSum
//    }
    
//    static func calculateWeekMedian(from samples: [HKQuantitySample], unit: HKUnit) -> Double {
//        let calendar = Calendar.current
//        let now = Date()
//        let oneWeekAgo = calendar.date(byAdding: .month, value: -1, to: now)!
//        let weekSamples = samples.filter { calendar.isDate($0.startDate, inSameDayAs: oneWeekAgo) || $0.startDate > oneWeekAgo }
//
//        // Group the samples by day
//        let groupedSamples = Dictionary(grouping: weekSamples) { sample in
//            calendar.startOfDay(for: sample.startDate)
//        }
//
//        // Calculate the values for each day
//        let dailyValues = groupedSamples.mapValues { samples in
//            samples.map { sample in
//                sample.quantity.doubleValue(for: unit)
//            }
//        }
//
//        // Calculate the median value
//        let median = dailyValues.values.flatMap { $0 }.median() ?? 0.0
//        return median
//    }
    
    
    
//    static func calculateWeekAverage(from samples: [HKQuantitySample], unit: HKUnit) -> Double {
//        let calendar = Calendar.current
//        let now = Date()
//        let oneWeekAgo = calendar.date(byAdding: .day, value: -1, to: now)!
//        let weekSamples = samples.filter { $0.startDate > oneWeekAgo }
//
//        // Group the samples by day
//        let groupedSamples = Dictionary(grouping: weekSamples) { sample in
//            calendar.startOfDay(for: sample.startDate)
//        }
//
//        // Calculate the sum of values for each day
//        let dailySums = groupedSamples.mapValues { samples in
//            samples.reduce(0.0) { sum, sample in
//                sum + sample.quantity.doubleValue(for: unit)
//            }
//        }
//
//        // Get the maximum sum of values for the week
//        let average = dailySums.values.reduce(0.0, +)
//        return average
//    }
    
    
    static func getAverage(from samples: [HKQuantitySample], unit: HKUnit, days: Int) -> Double {
        let calendar = Calendar.current
        let now = Date()
        let previousDay = calendar.date(byAdding: .day, value: -1, to: now)!
        let startDate = calendar.date(byAdding: .day, value: -days, to: previousDay)!
        
        let daySamples = samples.filter { sample in
            let sampleDay = calendar.startOfDay(for: sample.startDate)
            return sampleDay >= startDate && sampleDay <= previousDay
        }
        
        let groupedSamples = Dictionary(grouping: daySamples) { sample in
            calendar.startOfDay(for: sample.startDate)
        }
        
        let dailySums = groupedSamples.map { _, samples in
            samples.reduce(0.0) { sum, sample in
                sum + sample.quantity.doubleValue(for: unit)
            }
        }
        
        let average = dailySums.reduce(0.0, +) / Double(days)
        return average
    }
    
    static func getMax(from samples: [HKQuantitySample], unit: HKUnit, days: Int) -> Double {
        let calendar = Calendar.current
        let now = Date()
        let previousDay = calendar.date(byAdding: .day, value: -1, to: now)!
        let startDate = calendar.date(byAdding: .day, value: -days, to: previousDay)!
        
        let daySamples = samples.filter { sample in
            let sampleDay = calendar.startOfDay(for: sample.startDate)
            return sampleDay >= startDate && sampleDay <= previousDay
        }
        
        let groupedSamples = Dictionary(grouping: daySamples) { sample in
            calendar.startOfDay(for: sample.startDate)
        }
        
        let dailySums = groupedSamples.map { _, samples in
            samples.reduce(0.0) { sum, sample in
                sum + sample.quantity.doubleValue(for: unit)
            }
        }
        
        let max = dailySums.max() ?? 0.0
        return max
    }
    
    static func getMed(from samples: [HKQuantitySample], unit: HKUnit, days: Int) -> Double {
        let calendar = Calendar.current
        let now = Date()
        let previousDay = calendar.date(byAdding: .day, value: -1, to: now)!
        let startDate = calendar.date(byAdding: .day, value: -days, to: previousDay)!
        
        let daySamples = samples.filter { sample in
            let sampleDay = calendar.startOfDay(for: sample.startDate)
            return sampleDay >= startDate && sampleDay <= previousDay
        }
        
        let groupedSamples = Dictionary(grouping: daySamples) { sample in
            calendar.startOfDay(for: sample.startDate)
        }
        
        var dailySums = groupedSamples.map { _, samples in
            samples.reduce(0.0) { sum, sample in
                sum + sample.quantity.doubleValue(for: unit)
            }
        }
        if (dailySums.count < days) {
            let difference = days - dailySums.count
            print("printing daily sums before")
            print(dailySums)
            dailySums += Array(repeating: 0.0, count: difference)
            print("printing daily sums after for week should be 1224000")
            print(dailySums)

        }
        
        let med = dailySums.median() ?? 0.0
        return med
    }
    
    
    static func getMin(from samples: [HKQuantitySample], unit: HKUnit, days: Int) -> Double {
        let calendar = Calendar.current
        let now = Date()
        let previousDay = calendar.date(byAdding: .day, value: -1, to: now)!
        let startDate = calendar.date(byAdding: .day, value: -days, to: previousDay)!
        
        let daySamples = samples.filter { sample in
            let sampleDay = calendar.startOfDay(for: sample.startDate)
            return sampleDay >= startDate && sampleDay <= previousDay
        }
        
        let groupedSamples = Dictionary(grouping: daySamples) { sample in
            calendar.startOfDay(for: sample.startDate)
        }
        
        let dailySums = groupedSamples.map { _, samples in
            samples.reduce(0.0) { sum, sample in
                sum + sample.quantity.doubleValue(for: unit)
            }
        }
        if (days > dailySums.count) {
            return 0.0
        }
        else {
            let min = dailySums.min() ?? 0.0
            return min
        }
    }
    
    
    
//    static func calculateYearMinimum(from samples: [HKQuantitySample], unit: HKUnit) -> Double {
//        let calendar = Calendar.current
//        let now = Date()
//        let oneYearAgo = calendar.date(byAdding: .year, value: -1, to: now)!
//        let yearSamples = samples.filter { calendar.isDate($0.startDate, inSameDayAs: oneYearAgo) || $0.startDate > oneYearAgo }
//
//        // Group the samples by day
//        let groupedSamples = Dictionary(grouping: yearSamples) { sample in
//            calendar.startOfDay(for: sample.startDate)
//        }
//
//        // Calculate the sum of values for each day
//        let dailySums = groupedSamples.mapValues { samples in
//            samples.reduce(0.0) { sum, sample in
//                sum + sample.quantity.doubleValue(for: unit)
//            }
//        }
//
//        // Get the minimum value
//        let minSum = dailySums.values.min() ?? 0.0
//        return minSum
//    }
    
//    static func calculateYearMaximum(from samples: [HKQuantitySample], unit: HKUnit) -> Double {
//        let calendar = Calendar.current
//        let now = Date()
//        let oneYearAgo = calendar.date(byAdding: .year, value: -1, to: now)!
//        let yearSamples = samples.filter { calendar.isDate($0.startDate, inSameDayAs: oneYearAgo) || $0.startDate > oneYearAgo }
//
//        // Group the samples by day
//        let groupedSamples = Dictionary(grouping: yearSamples) { sample in
//            calendar.startOfDay(for: sample.startDate)
//        }
//
//        // Calculate the sum of values for each day
//        let dailySums = groupedSamples.mapValues { samples in
//            samples.reduce(0.0) { sum, sample in
//                sum + sample.quantity.doubleValue(for: unit)
//            }
//        }
//
//        // Get the minimum value
//        let maxSum = dailySums.values.max() ?? 0.0
//        return maxSum
//    }
//
//    static func calculateYearMedian(from samples: [HKQuantitySample], unit: HKUnit) -> Double {
//        let calendar = Calendar.current
//        let now = Date()
//        let oneYearAgo = calendar.date(byAdding: .year, value: -1, to: now)!
//        let yearSamples = samples.filter { calendar.isDate($0.startDate, inSameDayAs: oneYearAgo) || $0.startDate > oneYearAgo }
//
//        // Group the samples by day
//        let groupedSamples = Dictionary(grouping: yearSamples) { sample in
//            calendar.startOfDay(for: sample.startDate)
//        }
//
//        // Calculate the values for each day
//        let dailyValues = groupedSamples.mapValues { samples in
//            samples.map { sample in
//                sample.quantity.doubleValue(for: unit)
//            }
//        }
//
//        // Calculate the median value
//        let median = dailyValues.values.flatMap { $0 }.median() ?? 0.0
//        return median
//    }
    
//    static func calculateYearAverage(from samples: [HKQuantitySample], unit: HKUnit) -> Double {
//        let calendar = Calendar.current
//        let now = Date()
//        let oneYearAgp = calendar.date(byAdding: .year, value: -1, to: now)!
//        let yearSamples = samples.filter { calendar.isDate($0.startDate, inSameDayAs: oneYearAgp) || $0.startDate > oneYearAgp }
//        
//        // Group the samples by day
//        let groupedSamples = Dictionary(grouping: yearSamples) { sample in
//            calendar.startOfDay(for: sample.startDate)
//        }
//        
//        // Calculate the sum of values for each day
//        let dailySums = groupedSamples.mapValues { samples in
//            samples.reduce(0.0) { sum, sample in
//                sum + sample.quantity.doubleValue(for: unit)
//            }
//        }
//        
//        // Get the maximum sum of values for the week
//        let average = dailySums.values.reduce(0.0, +) / Double(dailySums.values.count)
//        return average
//    }
    
    
    static func calculateOverallAverage(from samples: [HKQuantitySample], unit: HKUnit) -> Double {
        let calendar = Calendar.current
        let now = Date()
        let previousDay = calendar.date(byAdding: .day, value: -1, to: now)!
        
        let daySamples = samples.filter { sample in
            let sampleDay = calendar.startOfDay(for: sample.startDate)
            return sampleDay <= previousDay
        }
        
        let groupedSamples = Dictionary(grouping: daySamples) { sample in
            calendar.startOfDay(for: sample.startDate)
        }
        
        let dailySums = groupedSamples.map { _, samples in
            samples.reduce(0.0) { sum, sample in
                sum + sample.quantity.doubleValue(for: unit)
            }
        }
        
        let earliestDate = groupedSamples.keys.min() ?? previousDay
        let numberOfDays = calendar.dateComponents([.day], from: earliestDate, to: previousDay).day ?? 0
        
        let average = dailySums.reduce(0.0, +) / Double(numberOfDays)
        return average
    }
    
    
    static func calculateWeekSumAverage(from samples: [HKQuantitySample], unit: HKUnit) -> Double {

        return 0.0
    }

    
    
    static func calculateOverallMaximum(from samples: [HKQuantitySample], unit: HKUnit) -> Double {
        let calendar = Calendar.current
        let now = Date()
        let previousDay = calendar.date(byAdding: .day, value: -1, to: now)!
        
        let daySamples = samples.filter { sample in
            let sampleDay = calendar.startOfDay(for: sample.startDate)
            return sampleDay <= previousDay
        }
        
        let groupedSamples = Dictionary(grouping: daySamples) { sample in
            calendar.startOfDay(for: sample.startDate)
        }
        
        let dailySums = groupedSamples.map { _, samples in
            samples.reduce(0.0) { sum, sample in
                sum + sample.quantity.doubleValue(for: unit)
            }
        }
        
        let maximum = dailySums.max() ?? 0.0
        return maximum
    }
    
    static func calculateOverallMin(from samples: [HKQuantitySample], unit: HKUnit) -> Double {
        let calendar = Calendar.current
        let now = Date()
        let previousDay = calendar.date(byAdding: .day, value: -1, to: now)!
        
        let daySamples = samples.filter { sample in
            let sampleDay = calendar.startOfDay(for: sample.startDate)
            return sampleDay <= previousDay
        }
        
        let groupedSamples = Dictionary(grouping: daySamples) { sample in
            calendar.startOfDay(for: sample.startDate)
        }
        
        let dailySums = groupedSamples.map { _, samples in
            samples.reduce(0.0) { sum, sample in
                sum + sample.quantity.doubleValue(for: unit)
            }
        }
        
        let earliestDate = groupedSamples.keys.min() ?? previousDay
        let numberOfDays = calendar.dateComponents([.day], from: earliestDate, to: previousDay).day ?? 0
        
        //if numberofdays>dailysums.count then return 0, otherwise return maximum of dailysums
        if numberOfDays > dailySums.count {
            return 0.0
        } else {
            let minimumValue = dailySums.min() ?? 0.0
            return minimumValue
        }
    }
    
    
    
    static func calculateOverallMed(from samples: [HKQuantitySample], unit: HKUnit) -> Double {
        let calendar = Calendar.current
        let now = Date()
        let previousDay = calendar.date(byAdding: .day, value: -1, to: now)!
        
        let daySamples = samples.filter { sample in
            let sampleDay = calendar.startOfDay(for: sample.startDate)
            return sampleDay <= previousDay
        }
        
        let groupedSamples = Dictionary(grouping: daySamples) { sample in
            calendar.startOfDay(for: sample.startDate)
        }
        
        var dailySums = groupedSamples.map { _, samples in
            samples.reduce(0.0) { sum, sample in
                sum + sample.quantity.doubleValue(for: unit)
            }
        }
        
        let earliestDate = groupedSamples.keys.min() ?? previousDay
        let numberOfDays = calendar.dateComponents([.day], from: earliestDate, to: previousDay).day ?? 0
        
        if (dailySums.count < numberOfDays) {
            let difference = numberOfDays - dailySums.count
            dailySums += Array(repeating: 0.0, count: difference)

        }
        
        let med = dailySums.median() ?? 0.0
        return med
    }
    
    
    static func calculateWeekSumMax(from samples: [HKQuantitySample], unit: HKUnit) -> Double
    {
        let calendar = Calendar.current
        let now = Date()
        let previousDay = calendar.date(byAdding: .day, value: -1, to: now)!
        
        let daySamples = samples.filter { sample in
            let sampleDay = calendar.startOfDay(for: sample.startDate)
            return sampleDay <= previousDay
        }
        
        let groupedSamples = Dictionary(grouping: daySamples) { sample in
            calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: sample.startDate)
        }
        
        let dailySums = groupedSamples.map { _, samples in
            samples.reduce(0.0) { sum, sample in
                sum + sample.quantity.doubleValue(for: unit)
            }
        }
        
        let maximum = dailySums.max() ?? 0.0
        return maximum
    }
    
    
    
    static func calculateWeekSumMin(from samples: [HKQuantitySample], unit: HKUnit) -> Double {
        let calendar = Calendar.current
        let now = Date()
        let previousDay = calendar.date(byAdding: .day, value: -1, to: now)!
        
        let daySamples = samples.filter { sample in
            let sampleDay = calendar.startOfDay(for: sample.startDate)
            return sampleDay <= previousDay
        }
        
        let groupedSamples = Dictionary(grouping: daySamples) { sample in
            calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: sample.startDate)
        }
        
        let dailySums = groupedSamples.map { _, samples in
            samples.reduce(0.0) { sum, sample in
                sum + sample.quantity.doubleValue(for: unit)
            }
        }
        
        let minimum = dailySums.min() ?? 0.0
        return minimum
    }
    
    static func calculateMonthSumAverage(from samples: [HKQuantitySample], unit: HKUnit) -> Double {
        let calendar = Calendar.current
        let now = Date()
        let previousDay = calendar.date(byAdding: .day, value: -1, to: now)!
        
        let daySamples = samples.filter { sample in
            let sampleDay = calendar.startOfDay(for: sample.startDate)
            return sampleDay <= previousDay
        }
        
        let groupedSamples = Dictionary(grouping: daySamples) { sample in
            let sampleMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: sample.startDate))!
            return calendar.startOfDay(for: sampleMonth)
        }
        
        let dailySums = groupedSamples.map { _, samples in
            samples.reduce(0.0) { sum, sample in
                sum + sample.quantity.doubleValue(for: unit)
            }
        }
        
        let average = dailySums.reduce(0.0, +) / Double(groupedSamples.count)
        return average
    }
    
    static func calculateMonthSumMinimum(from samples: [HKQuantitySample], unit: HKUnit) -> Double {
        let calendar = Calendar.current
        let now = Date()
        let previousDay = calendar.date(byAdding: .day, value: -1, to: now)!
        
        let daySamples = samples.filter { sample in
            let sampleDay = calendar.startOfDay(for: sample.startDate)
            return sampleDay <= previousDay
        }
        
        let groupedSamples = Dictionary(grouping: daySamples) { sample in
            let sampleMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: sample.startDate))!
            return calendar.startOfDay(for: sampleMonth)
        }
        
        let dailySums = groupedSamples.map { _, samples in
            samples.reduce(0.0) { sum, sample in
                sum + sample.quantity.doubleValue(for: unit)
            }
        }
        
        let minimum = dailySums.min() ?? 0.0
        return minimum
    }
    
    static func calculateMonthSumMaximum(from samples: [HKQuantitySample], unit: HKUnit) -> Double {
        let calendar = Calendar.current
        let now = Date()
        let previousDay = calendar.date(byAdding: .day, value: -1, to: now)!
        
        let daySamples = samples.filter { sample in
            let sampleDay = calendar.startOfDay(for: sample.startDate)
            return sampleDay <= previousDay
        }
        
        let groupedSamples = Dictionary(grouping: daySamples) { sample in
            let sampleMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: sample.startDate))!
            return calendar.startOfDay(for: sampleMonth)
        }
        
        let dailySums = groupedSamples.map { _, samples in
            samples.reduce(0.0) { sum, sample in
                sum + sample.quantity.doubleValue(for: unit)
            }
        }
        
        let maxiumum = dailySums.max() ?? 0.0
        return maxiumum
    }
    
}

