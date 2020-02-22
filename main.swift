/**
Simulation app for in-class demonstration of viral infection from neighbor to neighbor.
*/


// Setup
enum HealthStatus {
    case infected
    case healthy
    case vaccinated
}

var yourStatus = HealthStatus.healthy
var vaccinationThreshold = 0.99
let vaccinationThresholdReduction = vaccinationThreshold * 0.001

var counter = 1
var infectedNeighbors = 0
var border = String(repeating:" 🤮 ", count:10)
border += "\n  " + border


// Simulation
while yourStatus == .healthy {

    // Infection based on neighbor count
    let neighborCount = askForNumber("Round \(counter): Number of infected neighbors?", defaultNumber: infectedNeighbors)
    infectedNeighbors = neighborCount

    let threshold = 1.0 - (0.1 * Double(neighborCount))
    let r = Double.random(in: 0.0 ... 1.0)    
    if r > threshold {
        yourStatus = .infected
        print("Infection \(r) over \(threshold)")
    } else {
        print("Infection \(r) under \(threshold) \n--> NOT Infected... yet. 😂")
    }

    // Vaccination?
    let v = Double.random(in: 0.0 ... 1.0)
    if v > vaccinationThreshold {
      yourStatus = .vaccinated
      print("Vax \(v) over \(vaccinationThreshold)")
    } else {
      print("Vax \(v) under \(vaccinationThreshold) \n--> NOT vaccinated!")
      vaccinationThreshold -= vaccinationThresholdReduction
    }

    counter += 1
    print()
}

// End Result
switch yourStatus {
  case .infected :
  print("\(border)")
  print("--> YOU ARE INFECTED!!! --> STAND UP!")
  print("\(border)\n\n\n\n\n\n")
  
  case .vaccinated :
  print("\n\n\n😇 👍\n --> YOU ARE VACCINATED!!! --> Give a thumbs up and smile!") 

  case .healthy :
  print("You are healthy, so how did you get here???") 
}

