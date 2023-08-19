let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)
// Prints "The number 5 is a prime number, and also an integer."


/// Return  (ITS IMPORTANT)

    func greet(person: [String: String]) {
        guard let name = person["name"] else {
        //usamos guard en caso que el diccionario se llame name
        //se le asigana el valor a la variable name
            return
        }
        print("Hello \(name)!")

        guard let location = person["location"] else {
        //si el diccionario se llama location se le asigna el valor
            print("I hope the weather is nice near you.")
            return
        }

        print("I hope the weather is nice in \(location).")
    }

    greet(person: ["name": "John"])
    // Prints "Hello John!"
    // Prints "I hope the weather is nice near you."
    greet(person: ["name": "Jane", "location": "Cupertino"])
    // Prints "Hello Jane!"
    // Prints "I hope the weather is nice in Cupertino."

    
/// REFER

    var score = 1
    if score < 10 {
    defer {
        print(score)
    }
    defer {
        print("The score is:")
    }
     //se ejecutará más adelante,al final del ámbito actual.
    score += 5
    }
    // Prints "The score is:"
    // Prints "6"


/// CHECKING API AVAILABILITY

    @available(macOS 10.12, *)
    struct ColorPreference {
        var bestColor = "blue"
    }


    func chooseBestColor() -> String {
        //Se comprueba si esta la version disponible
        guard #available(macOS 10.12, *) else {
        return "gray"
        }
        let colors = ColorPreference()
        return colors.bestColor
    }