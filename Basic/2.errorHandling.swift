
//  A function indicates that it can throw an error by including the throws keyword 
    func makeASandwich() throws {
        // ...
    }

    do {
        try makeASandwich()
        eatASandwich()
    } catch SandwichError.outOfCleanDishes {
        washDishes()
    } catch SandwichError.missingIngredients(let ingredients) {
        buyGroceries(ingredients)
    }

//Assertions and preconditions are checks that happen at runtime. 
//You write an assertion by calling the assert(condition:message:file:line:)

    let age = -3
    assert(age >= 0, "A person's age can't be less than zero.")
    // This assertion fails because -3 isn't >= 0.

    if age > 10 {
        print("You can ride the roller-coaster or the ferris wheel.")
    } else if age >= 0 {
        print("You can ride the ferris wheel.")
    } else {
        assertionFailure("A person's age can't be less than zero.")
    }

    /* Use a precondition whenever a condition has the potential to be false,
    but must definitely be true for your code to continue execution.
    Use to check that a function has been passed a valid value.  */

    precondition(index > 0, "Index must be greater than zero.")
