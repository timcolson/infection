/**
Simulation app for in-class demonstration of viral infection from neighbor to neighbor.
*/

enum HealthStatus {
    case infected
    case healthy
}
var yourStatus = HealthStatus.healthy
var counter = 1
var infectedNeighbors = 0
var border = String(repeating:" 🤮 ", count:10)
border += "\n  " + border


while yourStatus == .healthy {
    let neighborCount = askForNumber("Round \(counter): Number of infected neighbors?", defaultNumber: infectedNeighbors)
    infectedNeighbors = neighborCount

    let threshold = 1.0 - (0.1 * Double(neighborCount))

    let r = Double.random(in: 0.0 ... 1.0)
    
    if r > threshold {
        yourStatus = .infected
        print("\n\n\n\n\(border)")
        print("\(r) over \(threshold)")
        print("--> YOU ARE INFECTED!!! --> STAND UP!")
        print("\(border)\n\n\n\n\n\n")
    } else {
        print("\(r) under \(threshold) \n--> NOT Infected... yet.")
    }

    counter += 1
    print()
}
