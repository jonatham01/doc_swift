func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
//  RETORNA MULTIPLES VALORES
    func minMax(array: [Int]) -> (min: Int, max: Int)? {
        if array.isEmpty { return nil }
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }

    if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
        print("min is \(bounds.min) and max is \(bounds.max)")
        // Prints "min is -6 and max is 109"
    }


/// Nombre de parametros y argumentos
    func someFunction(firstParameterName: Int, secondParameterName: Int) {}

    someFunction(firstParameterName: 1, secondParameterName: 2)


/// Specifying Argument 
    func greet(person: String, from hometown: String) -> String {
        return "Hello \(person)!  Glad you could visit from \(hometown)."
    }
    print(greet(person: "Bill", from: "Cupertino"))


/// OMITIR ETIQUTA DE ARGUMENTO CON _
    func someFunction(_ firstParameterName: Int, secondParameterName: Int) {}
    someFunction(1, secondParameterName: 2)


/// Darle valores a los parametros por default
    func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) { }

    someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6

    someFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12


/// VARIADIC PARAMETERS
    func arithmeticMean(_ numbers: Double...) -> Double {
        var total: Double = 0
        for number in numbers {
            total += number
        }
        return total / Double(numbers.count)
    }
    arithmeticMean(1, 2, 3, 4, 5) // returns 3.0
    arithmeticMean(3, 8.25, 18.75) // returns 10.0


/// In-Out Parameters
/// Se utiliza la palabra clave inout. 
/// Se cambian los valores de las variables que pasan los valores
    func swapTwoInts(_ a: inout Int, _ b: inout Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    var someInt = 3
    var anotherInt = 107
    swapTwoInts(&someInt, &anotherInt)
    print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
    // Prints "someInt is now 107, and anotherInt is now 3"


//  FUNCTIONS TYPES
    var mathFunction: (Int, Int) -> Int = addTwoInts

//  Usado como parametro
    func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
        print("Result: \(mathFunction(a, b))")
    }
    printMathResult(addTwoInts, 3, 5)    // Prints "Result: 8"


/// NESTED FUNCTIONS
    func chooseStepFunction(backward: Bool) -> (Int) -> Int {
        func stepForward(input: Int) -> Int { return input + 1 }
        func stepBackward(input: Int) -> Int { return input - 1 }
        return backward ? stepBackward : stepForward
    }
    var currentValue = -4
    let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
    // moveNearerToZero now refers to the nested stepForward() function
    while currentValue != 0 {
        print("\(currentValue)... ")
        currentValue = moveNearerToZero(currentValue)
    }
    print("zero!")
    // -4...
    // -3...
    // -2...
    // -1...
    // zero!