    enum Planet {
        case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
    }

    enum CompassPoint {
    case north, south, east, west
    }

    var directionToHead = CompassPoint.west
    directionToHead = .east //se cambia el valor

    directionToHead = .south

    switch directionToHead {
    case .south:
        print("Watch out for penguins")
    }
/// ITERABLES
    enum Beverage: CaseIterable {
        case coffee, tea, juice
    }
    let numberOfChoices = Beverage.allCases.count

    for beverage in Beverage.allCases { print(beverage) }

///  valores asociados
    enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
    }
    var productBarcode = Barcode.upc(8, 85909, 51226, 3)
    productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

    switch productBarcode {
    case .upc(let numberSystem, let manufacturer, let product, let check):
        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
    case .qrCode(let productCode):
        print("QR code: \(productCode).")
    }


/// VALORES BRUTOS
    enum ASCIIControlCharacter: Character {
        case tab = "\t"
        case lineFeed = "\n"
        case carriageReturn = "\r"
    }

    enum Planet: Int {
        case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    }
    let earthsOrder = Planet.earth.rawValue //3
    let possiblePlanet = Planet(rawValue: 7) //URANUS



/// Recursive enumeration
    indirect enum ArithmeticExpression {
        case number(Int)
        case addition(ArithmeticExpression, ArithmeticExpression)
        case multiplication(ArithmeticExpression, ArithmeticExpression)
    }
    let five = ArithmeticExpression.number(5)
    let four = ArithmeticExpression.number(4)
    let sum = ArithmeticExpression.addition(five, four)
    let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))


