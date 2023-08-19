let pi = 3.14159
// pi is inferred to be of type Double

// Literals
let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation

let exponentDouble = 1.21875e2   //Elevado a la2
let hexadecimalDouble = 0xC.3p0  

//formato adicional para que sean más fáciles de leer.
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

let cannotBeNegative: UInt8 = -1
// UInt8 can't store negative numbers, and so this will report an error


//no podemos sumar variables de diferente tipo asi que creamos una nueva variable
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)


//conversion de entero a flotante
// pi equals 3.14159, and is inferred to be of type Double
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine

let integerPi = Int(pi)
// integerPi equals 3, and is inferred to be of type Int

/////////// ALIAS DE TIPO
//Almacena un tipo de dato

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min
// maxAmplitudeFound is now 0


//TUPLAS

let http404Error = (404, "Not Found") // http404Error is of type (Int, String), and equals (404, "Not Found")

//Descomponer tuplas
let (statusCode, statusMessage) = http404Error

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)") // Prints "The status code is 404"
print("The status code is \(http404Error.0)") // Prints "The status code is 404"
print("The status message is \(http404Error.1)") // Prints "The status message is Not Found"

let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)") // Prints "The status code is 200"
print("The status message is \(http200Status.description)") // Prints "The status message is OK"


//convertir string a int
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber is inferred to be of type "Int?", or "optional Int"

/// OPTIONAL

    var surveyAnswer: String?

    var serverResponseCode: Int? = 404
    // serverResponseCode contains an actual Int value of 404
    serverResponseCode = nil
    // serverResponseCode now contains no value

    //Validar si valor no es nulo 
    if convertedNumber != nil {
        print("convertedNumber contains some integer value.")
    }

    if let myNumber {
        print("My number is \(myNumber)") // Prints "My number is 123"
    }

//. El uso principal de opcionales desempaquetados implícitamente en Swift 
//es durante la inicialización

    let possibleString: String? = "An optional string."
    let forcedString: String = possibleString! // requires an exclamation point


    let assumedString: String! = "An implicitly unwrapped optional string."
    let implicitString: String = assumedString // no need for an exclamation point