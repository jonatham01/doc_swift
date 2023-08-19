    class Vehicle {
        var currentSpeed = 0.0
        var description: String {
            return "traveling at \(currentSpeed) miles per hour"
        }
        func makeNoise() {  }
    }

    class Bicycle: Vehicle {
        var hasBasket = false
    }

    class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
    }

    let tandem = Tandem()
    tandem.hasBasket = true
    tandem.currentNumberOfPassengers = 2
    tandem.currentSpeed = 22.0

//  override
    class Train: Vehicle {
        override func makeNoise() {
            print("Choo Choo")
        }

//  Anular propiedades
//  super
    class Car: Vehicle {
        var gear = 1
        override var description: String {
            return super.description + " in gear \(gear)"
        }
    }

//  Anulación de los observadores de propiedades
    class AutomaticCar: Car {
        override var currentSpeed: Double {
            didSet {
                gear = Int(currentSpeed / 10.0) + 1
            }
        }
    }

//  Puede evitar que se invalide un método, propiedad o subíndice marcándolo como final.

