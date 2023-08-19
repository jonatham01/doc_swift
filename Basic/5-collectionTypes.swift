
var someInts: [Int] = []
print("someInts is of type [Int] with \(someInts.count) items.")

someInts.append(3)
// someInts now contains 1 value of type Int
someInts = []
// someInts is now an empty array, but is still of type [Int]

var threeDoubles = Array(repeating: 0.0, count: 3)
// threeDoubles is of type [Double], and equals [0.0, 0.0, 0.0]


var shoppingList = ["Eggs", "Milk"]
var validateOfList = shoppingList.isEmpty 

shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList[0]

shoppingList[0] = "Six eggs" // the first item in the list is now equal to "Six eggs" 

shoppingList[4...6] = ["Bananas", "Apples"] // shoppingList now contains 6 items

shoppingList.insert("Maple Syrup", at: 0)

let mapleSyrup = shoppingList.remove(at: 0)

let apples = shoppingList.removeLast()


// ITERACION
for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

//Un  SET almacena valores distintos del mismo tipo en una colección sin un orden definido
// Cuando necesita asegurarse de que un elemento solo aparece una vez.

    var letters = Set<Character>()
    letters.insert("a")
    // letters now contains 1 value of type Character
    letters = []
    // letters is now an empty set, but is still of type Set<Character>
    var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

    //REMOVE
    if let removedGenre = favoriteGenres.remove("Rock") {
        print("\(removedGenre)? I'm over it.")
    } else {
        print("I never much cared for that.")
    }
    // Prints "Rock? I'm over it."

    let x = favoriteGenres.contains("Funk") //false

    //sorted
    for genre in favoriteGenres.sorted() { print("\(genre)") }


// SET OPERATIONS

    let oddDigits: Set = [1, 3, 5, 7, 9]
    let evenDigits: Set = [0, 2, 4, 6, 8]
    let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]


oddDigits.union(evenDigits).sorted() // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

oddDigits.intersection(evenDigits).sorted()// []

oddDigits.subtracting(singleDigitPrimeNumbers).sorted()// [1, 9]  

oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted() // [1, 2, 9]


let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
//si todos los valores de un conjunto están contenidos en el conjunto especificado.

farmAnimals.isSuperset(of: houseAnimals)
//isSuperset(of:) si un conjunto contiene todos los valores de un conjunto especificado.

farmAnimals.isDisjoint(with: cityAnimals)
// es subconjunto o superconjunto, pero no igual a un conjunto especificado


// DICTIONARIES
    var namesOfIntegers: [Int: String] = [:]
    namesOfIntegers[16] = "sixteen"

    var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    airports["LHR"] = "London"
    airports["LHR"] = "London Heathrow" //its changed

    var x= airports.count
    var y= airports.isEmpty

    airports.updateValue("Dublin Airport", forKey: "DUB") 
    
    airports["APL"] = "Apple International"
    airports["APL"] = nil // APL has now been removed from the dictionary
    airports.removeValue(forKey: "DUB")

// DICTIONARY CONDITIONS
    if let airportName = airports["DUB"] {
        print("The name of the airport is \(airportName).")
    } else {
        print("That airport isn't in the airports dictionary.")
    }

// Iteracion 
    for (airportCode, airportName) in airports {
        print("\(airportCode): \(airportName)")
    }

    for airportCode in airports.keys {
        print("Airport code: \(airportCode)") 
        // Airport code: LHR 
        // Airport code: YYZ
    }

    for airportName in airports.values {
        print("Airport name: \(airportName)")
        // Airport name: London Heathrow
        // Airport name: Toronto Pearson
    }

//convertir en array
    let airportCodes = [String](airports.keys)
    // airportCodes is ["LHR", "YYZ"]


    let airportNames = [String](airports.values)
    // airportNames is ["London Heathrow", "Toronto Pearson"]