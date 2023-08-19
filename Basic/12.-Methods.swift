    class Counter {
        var count = 0
        func increment() {
            count += 1
        }
        func increment(by amount: Int) {
            count += amount
        }
        func reset() {
            count = 0
        }
    }

// SELF -> equivalente a la propia instancia 
// La excepción principal a esta regla se produce cuando un nombre de parámetro para
// un método de instancia tiene el mismo nombre que una propiedad de esa instancia.

    struct Point {
        var x = 0.0, y = 0.0
        func isToTheRightOf(x: Double) -> Bool {
            return self.x > x
        }
    }
    
/// METODO MUTANTE
//  Puede optar por este comportamiento colocando la palabra clave antes de la palabra clave para ese método:mutatingfunc
    struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}

//  TYPE METHODS
//  Las clases pueden usar la palabra clave en su lugar, 
//  para permitir que las subclases anulen la implementación de ese método por parte de la superclase


    struct LevelTracker {
        static var highestUnlockedLevel = 1
        var currentLevel = 1

        static func unlock(_ level: Int) {
            if level > highestUnlockedLevel { highestUnlockedLevel = level }
        }

        //permite validar si el nivel ya a sido desbloqueado
        //si el numero es mayor dira false
        static func isUnlocked(_ level: Int) -> Bool {
            return level <= highestUnlockedLevel
        }

        // . Antes de actualizar , este método comprueba si el nuevo nivel solicitado ya está desbloqueado.
        // se utiliza el atributo @discardableResult para ignorar el valor devuelto en el return en caso de no guardarlo en una varibale
        @discardableResult
        mutating func advance(to level: Int) -> Bool {
            if LevelTracker.isUnlocked(level) {
                currentLevel = level
                return true
            } else {
                return false
            }
        }
    }

    class Player {
        var tracker = LevelTracker()
        let playerName: String
        func complete(level: Int) {
            LevelTracker.unlock(level + 1)
            tracker.advance(to: level + 1)
        }
        init(name: String) {
            playerName = name
        }
    }

    var player = Player(name: "Argyrios")
    player.complete(level: 1)
    print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
    // Prints "highest unlocked level is now 2"

    player = Player(name: "Beto")
    if player.tracker.advance(to: 6) {
        print("player is now on level 6")
    } else {
        print("level 6 hasn't yet been unlocked")
    }
    // Prints "level 6 hasn't yet been unlocked"
