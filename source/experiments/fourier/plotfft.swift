import Foundation

func readData(from file: String) -> [Double]? {
    guard let url = URL(string: file) else { return nil }
    
    do {
        let contents = try String(contentsOf: url)
        let lines = contents.split(separator: "\n")
        let data = lines.compactMap { Double($0.trimmingCharacters(in: .whitespacesAndNewlines)) }
        return data
    } catch {
        print("Error reading file: \(error)")
        return nil
    }
}
