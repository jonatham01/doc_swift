
//MultiLine

//When your source code includes a line break inside of a multiline string literal
// that line break also appears in the string’s value

let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""


/*Scape Chracters  
\"   comillas
\0   nulo
\\   diagonal inversa
\t   tabulacion horizontal
\n  enter
\r retonro de carro
*/
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"

//Unicode
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496

let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: ""
"""#


//EMPTY STRING
var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
// these two strings are both empty, and are equivalent to each other

if emptyString.isEmpty {
    print("Nothing to see here")
}


//STRING MUTABILITY
var variableString = "Horse"
variableString += " and carriage"// variableString is now "Horse and carriage"

let constantString = "Highlander"
constantString += "and another Highlander" 
// this reports a compile-time error - a constant string cannot be modified


//Chracters
for character in "Dog!🐶" {
    print(character) // D // o  // g // !  // 🐶
}

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString) // Prints "Cat!🐱"

let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
let exclamationMark: Character = "!"
welcome.append(exclamationMark)


//string interpolation
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"

print(#"Write an interpolated string in Swift using \(multiplier)."#)
// Prints "Write an interpolated string in Swift using \(multiplier)."

print(#"6 times 7 is \#(6 * 7)."#)
// Prints "6 times 7 is 42."


//COUNTING CHARACTERS
var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in cafe is 4"

//String Indices
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a

greeting[greeting.endIndex] // Error
greeting.index(after: greeting.endIndex) // Error

for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "") // "G u t e n   T a g ! "
}


//string.insert -- remove
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex) //"hello!"

welcome.remove(at: welcome.index(before: welcome.endIndex)) // "hello there"
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range) //"hello"
 

 //SUBSTRING

 let greeting = "Hello, world!"
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex 
//Returna el valor del index del separador, sino muestre el endindex
let beginning = greeting[..<index]
//retorna la cadana hasta antes del separador
let newString = String(beginning)
// Convert the result to a String for long-term storage.


//hasPrefix(_:)hasSuffix(_:)
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}