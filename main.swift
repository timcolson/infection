/**
Simulation app for in-class demonstration of viral infection from neighbor to neighbor.
*/
import Foundation

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
  print("Threshold with \(infectedNeighbors) infected neighbors : \(dformat(threshold))")

// Simulate Vaccination
    print("... simulating vaccination with \(dformat(vaccinationThreshold)) vax threshold...")
    sleep(1)

    let v = Double.random(in: 0.0 ... 1.0)
    if v > vaccinationThreshold {
      yourStatus = .vaccinated
      print(" Yay! \(dformat(v)) exceeded \(dformat(vaccinationThreshold)) vax threshold!")
      break
    } else {
      print(" \(dformat(v)) under \(dformat(vaccinationThreshold)) vax threshold --> NOT vaccinated!")
      vaccinationThreshold -= vaccinationThresholdReduction
    }


    
    print("... simulating transmission ...")
    sleep(1)

    if r > threshold {
        yourStatus = .infected
        print(" \(dformat(r)) exceeded threshold, you are infected!")
    } else {
        print(" \(dformat(r)) was under threshold, you are healthy!")
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

