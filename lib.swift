import Foundation

func askForNumber(_ prompt: String, defaultNumber: Int = 0) -> Int {
  print(prompt, terminator:" (\(defaultNumber)) > ")

  while true {
    if let input = readLine() {
      if input == "" {
        return defaultNumber
      } else if let n = Int(input) {
        return n
      }
    }         
    print("Invalid entry, try again > ", terminator:"")
  }
}

func dformat(_ n: Double, places: Int = 4) -> String {
  return String(format:"%.\(places)f", n)
}