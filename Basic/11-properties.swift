/// Stored Properties
    struct FixedLengthRange {
        var firstValue: Int
        let length: Int
    }
    var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
    rangeOfThreeItems.firstValue = 6

/// Lazy Stored Properties
    class DataImporter {
        var filename = "data.txt"
    }

    class DataManager {
        lazy var importer = DataImporter()
        var data: [String] = []
    }

    let manager = DataManager()
    manager.data.append("Some data")
    print(manager.importer.filename)
    //proporcionar acceso a esta matriz de datos

/*
    Toda la información sobre la propiedad, incluidos su nombre, tipo 
    y características de administración de memoria,
    se define en una única ubicación como parte de la definición del tipo.
 */

/// Computed Properties
    struct Point {
        var x = 0.0, y = 0.0
    }
    struct Size {
        var width = 0.0, height = 0.0
    }
    struct Rect {
        var origin = Point()
        var size = Size()
        var center: Point {
            get {
                let centerX = origin.x + (size.width / 2)
                let centerY = origin.y + (size.height / 2)
                return Point(x: centerX, y: centerY)
            }
            set(newCenter) {
                origin.x = newCenter.x - (size.width / 2)
                origin.y = newCenter.y - (size.height / 2)
            }
        }
        }
        var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))

        let initialSquareCenter = square.center
        // initialSquareCenter is at (5.0, 5.0)
        square.center = Point(x: 15.0, y: 15.0)
        print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
        // Prints "square.origin is now at (10.0, 10.0)"


/// PROPIEDADES DE SOLO LECTURA
    struct CompactRect {
        var origin = Point()
        var size = Size()
        var center: Point {
            get {
                Point(x: origin.x + (size.width / 2),
                    y: origin.y + (size.height / 2))
            }
        }
    }


/// OBSERVERS ----------------IMPORTANT

//  si implementa un observador, se le pasa un parámetro constante 
//  que contiene el valor de la propiedad anterior. 
//  En este caso oldValue
    class StepCounter {
        var totalSteps: Int = 0 {

            willSet(newTotalSteps) {  print("About to set totalSteps to \(newTotalSteps)")  }

            didSet {
                if totalSteps > oldValue  {
                    print("Added \(totalSteps - oldValue) steps")
                }
            }
        }
    }
    let stepCounter = StepCounter()
    stepCounter.totalSteps = 200  // About to set totalSteps to 200 / Added 200 steps
    stepCounter.totalSteps = 360     // About to set totalSteps to 360  // Added 160 steps



/// WRAPERS
// In the code below, the structure ensures that the value it wraps always contains a number 
// less than or equal to 12. If you ask it to store a larger number, it stores 12

    @propertyWrapper
    struct TwelveOrLess {
        private var number = 0
        var wrappedValue: Int {
            get { return number }
            set { number = min(newValue, 12) }
        }
    }

    struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
    }

    var rectangle = SmallRectangle()
    print(rectangle.height)
    // Prints "0"

    rectangle.height = 10
    print(rectangle.height)
    // Prints "10"

    rectangle.height = 24
    print(rectangle.height)
    // Prints "12"


    ///EJEMPLOS 2
    @propertyWrapper
    struct SmallNumber {
        private var maximum: Int
        private var number: Int

        var wrappedValue: Int {
            get { return number }
            set { number = min(newValue, maximum) }
        }
        init() {
            maximum = 12
            number = 0
        }
        init(wrappedValue: Int) {
            maximum = 12
            number = min(wrappedValue, maximum)
        }
        init(wrappedValue: Int, maximum: Int) {
            self.maximum = maximum
            number = min(wrappedValue, maximum)
        }
    }

    struct ZeroRectangle {
        @SmallNumber var height: Int
        @SmallNumber var width: Int
    }
    var zeroRectangle = ZeroRectangle()
    print(zeroRectangle.height, zeroRectangle.width)
    // Prints "0 0"
    
    
    struct UnitRectangle {
        @SmallNumber var height: Int = 1
        @SmallNumber var width: Int = 1
    }

    var unitRectangle = UnitRectangle()
    print(unitRectangle.height, unitRectangle.width)
    // Prints "1 1"

    struct NarrowRectangle {
        @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
        @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
    }

    var narrowRectangle = NarrowRectangle()
    print(narrowRectangle.height, narrowRectangle.width)
    // Prints "2 3"

    narrowRectangle.height = 100
    narrowRectangle.width = 100
    print(narrowRectangle.height, narrowRectangle.width)
    // Prints "5 4"



/// PROYECCION 
//  -> https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties#Projecting-a-Value-From-a-Property-Wrapper
    @propertyWrapper
    struct SmallNumber {
        private var number: Int
        private(set) var projectedValue: Bool


        var wrappedValue: Int {
            get { return number }
            set {
                if newValue > 12 {
                    number = 12
                    projectedValue = true
                } else {
                    number = newValue
                    projectedValue = false
                }
            }
        }
        init() {
            self.number = 0
            self.projectedValue = false
        }
    }

    struct SomeStructure {
        @SmallNumber var someNumber: Int
    }
    var someStructure = SomeStructure()

    someStructure.someNumber = 4
    print(someStructure.$someNumber)
    // Prints "false"

    someStructure.someNumber = 55
    print(someStructure.$someNumber)
    // Prints "true"


    // *** Ejemplo 2 **
    enum Size {
    case small, large
    }

    struct SizedRectangle {
        @SmallNumber var height: Int
        @SmallNumber var width: Int


        mutating func resize(to size: Size) -> Bool {
            switch size {
            case .small:
                height = 10
                width = 20
            case .large:
                height = 100
                width = 100
            }
            return $height || $width
        }
    }


/// TYPE PROPERTIES --STATIC

    struct AudioChannel {
        static let thresholdLevel = 10
        static var maxInputLevelForAllChannels = 0
        var currentLevel: Int = 0 {
            didSet {
                if currentLevel > AudioChannel.thresholdLevel {
                    // cap the new audio level to the threshold level
                    currentLevel = AudioChannel.thresholdLevel
                }
                if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                    // store this as the new overall maximum input level
                    AudioChannel.maxInputLevelForAllChannels = currentLevel
                }
            }
        }
    }

    var leftChannel = AudioChannel()
    var rightChannel = AudioChannel()

    leftChannel.currentLevel = 7
    print(leftChannel.currentLevel)  // Prints "7"
    print(AudioChannel.maxInputLevelForAllChannels)  // Prints "7

    rightChannel.currentLevel = 11
    print(rightChannel.currentLevel) // Prints "10"
    print(AudioChannel.maxInputLevelForAllChannels) // Prints "10"
    //se llama desde audiochanel y no de leftchanel
    
   
