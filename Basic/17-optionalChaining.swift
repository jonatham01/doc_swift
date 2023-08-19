//  Optional Chaining as an Alternative to Forced Unwrapping
    class Person {
        var residence: Residence?
    }
    class Residence {
        var numberOfRooms = 1
    }
    let john = Person()
    let roomCount = john.residence!.numberOfRooms
    // this triggers a runtime error
    john.residence = Residence()

//  modificamos residence
    class Residence {
        var rooms: [Room] = []
        var numberOfRooms: Int {
            return rooms.count
        }
        subscript(i: Int) -> Room {
            get {
                return rooms[i]
            }
            set {
                rooms[i] = newValue
            }
        }
        func printNumberOfRooms() {
            print("The number of rooms is \(numberOfRooms)")
        }
        var address: Address?
    }
    class Room {
        let name: String
        init(name: String) { self.name = name }
    }
    class Address {
        var buildingName: String?
        var buildingNumber: String?
        var street: String?
        func buildingIdentifier() -> String? {
            if let buildingNumber = buildingNumber, let street = street {
                return "\(buildingNumber) \(street)"
            } else if buildingName != nil {
                return buildingName
            } else {
                return nil
            }
        }
    }
    let john = Person()
    func createAddress() -> Address {
        print("Function was called.")
        let someAddress = Address()
        someAddress.buildingNumber = "29"
        someAddress.street = "Acacia Road"
        return someAddress
    }
    john.residence?.address = createAddress()

//  Llamar metodos con optional chaining
    if john.residence?.printNumberOfRooms() != nil {
        print("It was possible to print the number of rooms.")
    } else {
        print("It was not possible to print the number of rooms.")
          // Prints "It was not possible to print the number of rooms."
    }

//  con subscripts
    john.residence?[0] = Room(name: "Bathroom")

    if let firstRoomName = john.residence?[0].name {
        print("The first room name is \(firstRoomName).")
    } else {
        print("Unable to retrieve the first room name.")
    }
    john.rooms.append(Room(name: "Living Room"))
    john.rooms.append(Room(name: "Kitchen"))

//  Accessing Subscripts of Optional Type
    var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
    testScores["Dave"]?[0] = 91
    testScores["Bev"]?[0] += 1
    testScores["Brian"]?[0] = 72


//  Linking Multiple Levels of Chaining
    let validation:Boolean = john.residence?.address?.street 
    let beginsWithThe = john.residence?.address?.buildingIdentifier()?.hasPrefix("The")