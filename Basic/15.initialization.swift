//  La inicialización es el proceso de preparar una instancia para su uso. 
// Implica establecer un valor inicial para cada propiedad almacenada 

    struct Celsius {
        var temperatureInCelsius: Double
        init(fromFahrenheit fahrenheit: Double) {
            temperatureInCelsius = (fahrenheit - 32.0) / 1.8
        }
        init(fromKelvin kelvin: Double) {
            temperatureInCelsius = kelvin - 273.15
        }
        init(_ celsius: Double) {
            temperatureInCelsius = celsius
        }
    }
    let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
    let bodyTemperature = Celsius(37.0)


//  Memberwise

    struct Size {
        var width = 0.0, height = 0.0
    }
    let twoByTwo = Size(width: 2.0, height: 2.0)
    let zeroByTwo = Size(height: 2.0)
    print(zeroByTwo.width, zeroByTwo.height)    // Prints "0.0 2.0"
    let zeroByZero = Size()
    print(zeroByZero.width, zeroByZero.height)  // Prints "0.0 0.0"


//  Anulacion del inicializador
//  las subclases no heredan sus inicializadores de superclase de forma predeterminada.
//  super se refiere a la super clase
//  self a la misma clase

    class Vehicle {
        var numberOfWheels = 0
        var description: String {
            return "\(numberOfWheels) wheel(s)"
        }
    }
    class Bicycle: Vehicle {
        override init() {
            super.init()
            numberOfWheels = 2
        }
    }
    class Hoverboard: Vehicle {
        var color: String
        init(color: String) {
            self.color = color
            // super.init() implicitly called here
        }
        override var description: String {
            return "\(super.description) in a beautiful \(color)"
        }
    }

//  Convenience init

    class Food {
        var name: String
        init(name: String) {
            self.name = name
        }
        convenience init() {
            self.init(name: "[Unnamed]")
        }
    }
    let mysteryMeat = Food() // mysteryMeat's name is "[Unnamed]"
    let mysteryMeat = Food() // mysteryMeat's name is "[Unnamed]"

    class RecipeIngredient: Food {
        var quantity: Int
        init(name: String, quantity: Int) {
            self.quantity = quantity
            super.init(name: name)
        }
        override convenience init(name: String) {
            self.init(name: name, quantity: 1)
        }
    }
    let oneMysteryItem = RecipeIngredient()
    let oneBacon = RecipeIngredient(name: "Bacon")
    let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

    class ShoppingListItem: RecipeIngredient {
        var purchased = false
        var description: String {
            var output = "\(quantity) x \(name)"
            output += purchased ? " ✔" : " ✘"
            return output
        }
    }


//  Inicializadores fallidos
    struct Animal {
        let species: String
        init?(species: String) {
            if species.isEmpty { return nil }
            self.species = species
        }
    }
    let anonymousCreature = Animal(species: "")
    if anonymousCreature == nil {
        print("The anonymous creature couldn't be initialized")
    }