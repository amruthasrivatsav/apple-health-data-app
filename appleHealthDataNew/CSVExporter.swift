import Foundation
import UIKit

class CSVExporter {
    
    class func convertToCSVString(data: [[String]]) -> String {
        var csvString = ""
        
        for row in data {
            let rowString = row.map { "\"\($0)\"" }.joined(separator: ",")
            csvString.append(rowString)
            csvString.append("\n")
        }
        
        return csvString
    }
    
    class func saveCSVFile(csvString: String, fileName: String, viewController: UIViewController) {
        let fileManager = FileManager.default
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        
        do {
            try csvString.write(to: fileURL, atomically: true, encoding: .utf8)
            print("CSV file saved at: \(fileURL.path)")
            
            DispatchQueue.main.async {
                let activityViewController = UIActivityViewController(activityItems: [fileURL], applicationActivities: nil)
                viewController.present(activityViewController, animated: true, completion: nil)
            }
        } catch {
            print("Error saving CSV file: \(error)")
        }
    }
}
