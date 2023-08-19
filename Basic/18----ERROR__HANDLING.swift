
/*
    Error handling is the process of responding to and recovering from error conditions in your program.
    Throwing an error lets you indicate that something unexpected happened and the normal flow of execution can’t continue.

    There are four ways to handle errors in Swift:
        You can propagate the error from a function to the code that calls that function,
        handle the error using a - statement, 
        handle the error as an optional value, 
        or assert that the error will not occur.
*/

//  1) Propagating Errors Using Throwing Functions
    struct Item {
        var price: Int
        var count: Int
    }
    class VendingMachine {
        var inventory = [
            "Candy Bar": Item(price: 12, count: 7),
            "Chips": Item(price: 10, count: 4),
            "Pretzels": Item(price: 7, count: 11)
        ]
        var coinsDeposited = 0

        func vend(itemNamed name: String) throws {
            guard let item = inventory[name] else {
                throw VendingMachineError.invalidSelection
            }
            guard item.count > 0 else {
                throw VendingMachineError.outOfStock
            }
            guard item.price <= coinsDeposited else {
                throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
            }
            coinsDeposited -= item.price

            var newItem = item
            newItem.count -= 1
            inventory[name] = newItem
            print("Dispensing \(name)")
        }
    }

    let favoriteSnacks = [
        "Alice": "Chips",
        "Bob": "Licorice",
        "Eve": "Pretzels",
    ]
    func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
        let snackName = favoriteSnacks[person] ?? "Candy Bar"
        try vendingMachine.vend(itemNamed: snackName)
    }


//  2) Handling Errors Using Do-Catch
    var vendingMachine = VendingMachine()
    vendingMachine.coinsDeposited = 8
    do {
        try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
        print("Success! Yum.")
    } catch VendingMachineError.invalidSelection {
        print("Invalid Selection.")
    } catch VendingMachineError.outOfStock {
        print("Out of Stock.")
    } catch VendingMachineError.insufficientFunds(let coinsNeeded) {
        print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
    } catch {
        print("Unexpected error: \(error).")
    }
    
//  Agrupar errores
    func nourish(with item: String) throws {
        do {
            try vendingMachine.vend(itemNamed: item)
        } catch is VendingMachineError {
            print("Couldn't buy that from the vending machine.")
        }
    }
//  catch para todos los errores
    func eat(item: String) throws {
        do {
            try vendingMachine.vend(itemNamed: item)
        } catch VendingMachineError.invalidSelection, VendingMachineError.insufficientFunds, VendingMachineError.outOfStock {
            print("Invalid selection, out of stock, or not enough money.")
        }
    }

//  3) Converting Errors to Optional Values

    func someThrowingFunction() throws -> Int { }

    let y: Int?
    do {
        y = try someThrowingFunction()
    } catch {
        y = nil
    } 

    func fetchData() -> Data? {
        if let data = try? fetchDataFromDisk() { return data }
        if let data = try? fetchDataFromServer() { return data }
        return nil
    }

//  4)let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")

    let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")


//  Especificación de acciones de limpieza
    func processFile(filename: String) throws {
        if exists(filename) {
            let file = open(filename)
            defer {
                close(file)
            }
            while let line = try file.readline() {
                // Work with the file.
            }
            // close(file) is called here, at the end of the scope.
        }
    }
