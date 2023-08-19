let b = 10
var a = 5
a = b
// a is now equal to 10

let (x, y) = (1, 2)
let x = 9 % 4    // equals 1----> 9 = (4 x 2) + 1


//MINUS
let three = 3
let minusThree = -three       // minusThree equals -3
let plusThree = -minusThree   // plusThree equals 3, or "minus minus three"
let alsoMinusSix = +minusSix  // alsoMinusSix equals -6


//  compound assignment operators 
    var a = 1
    a += 2 // a is now equal to 3

    (1, "zebra") < (2, "apple")   
    // true because 1 is less than 2; "zebra" and "apple" aren't compared
    (3, "apple") < (3, "bird")    
    // true because 3 is equal to 3, and "apple" is less than "bird"
    (4, "dog") == (4, "dog")      
    // true because 4 is equal to 4, and "dog" is equal to "dog"
    ("blue", -1) < ("purple", 1)        
    // OK, evaluates to true
    ("blue", false) < ("purple", true)  
    // Error because < can't compare Boolean values

//  TERNARY CONDITIONAL 
    let contentHeight = 40
    let hasHeader = true
    let rowHeight = contentHeight + (hasHeader ? 50 : 20) // rowHeight is equal to 90

    //nil-coalescing operator () unwraps an optional if it contains a value,
    //or returns a default value if is 
    a != nil ? a! : b

    let defaultColorName = "red"
    var userDefinedColorName: String?   // defaults to nil
    var colorNameToUse = userDefinedColorName ?? defaultColorName


//  CLOSED RANGE OPERATOR: define un rango de valores
    for index in 1...5 {
        print("\(index) times 5 is \(index * 5)")
    }


//  HALF-OPEN RANGE OPERATOR
    let names = ["Anna", "Alex", "Brian", "Jack"]
    let count = names.count
    for i in 0..<count {
        print("Person \(i + 1) is called \(names[i])")
    }
    // Person 1 is called Anna
    // Person 2 is called Alex
    // Person 3 is called Brian
    // Person 4 is called Jack


//  ONE-SIDED RANGES
    for name in names[2...] {
        print(name) // Brian // Jack
    }

    for name in names[...2] {
        print(name) // Anna // Alex  // Brian
    }

    let range = ...5
    range.contains(7)   // false
    range.contains(4)   // true
    range.contains(-1)  // true


//  Conditionals
    if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
        print("Welcome!")
    } else {
        print("ACCESS DENIED")
    }