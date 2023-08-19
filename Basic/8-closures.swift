/// Expresiones de cierre
/// Metodo ordenado
    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

    func backward(_ s1: String, _ s2: String) -> Bool {
        return s1 > s2
    }
    var reversedNames = names.sorted(by: backward)
    // ["Ewa", "Daniella", "Chris", "Barry", "Alex"]

    reversedNames = names.sorted(by: { 
        (s1: String, s2: String) -> Bool in return s1 > s2
    })

//  (<#parameters#>) -> <#return type#> in  <#statements#>
    reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
//  nombres de argumentos abreviados a los cierres
    reversedNames = names.sorted(by: { $0 > $1 } )
//  METODOS DEL OPERADOR
    reversedNames = names.sorted(by: >)


//  Cierres finales
let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
/*
    La llamada al subíndice del diccionario va seguida de un signo de 
    exclamación (), porque los subíndices del diccionario devuelven un valor
    opcional para indicar que la búsqueda del diccionario puede fallar
    si la clave no existe. En el ejemplo anterior, se garantiza que 
    siempre será una clave de subíndice válida para el diccionario, 
    por lo que se usa un signo de exclamación para forzar el desempaquetado
    del valor almacenado en el valor devuelto opcional del subíndice
*/

    func loadPicture(from server: Server, completion: (Picture) -> Void, onFailure: () -> Void) {
        if let picture = download("photo.jpg", from: server) {
            completion(picture)
        } else {
            onFailure()
        }
    }

/// CAPTURA DE VALORES--------------------------------------------IMPORTANT
    func makeIncrementer(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        func incrementer() -> Int {
            runningTotal += amount
            return runningTotal
        }
        return incrementer
    }

    let incrementByTen = makeIncrementer(forIncrement: 10)
    incrementByTen()
    incrementByTen()


/// AutoClosures
//  An autoclosure is a closure that’s automatically created to wrap an expression that’s 
//  being passed as an argument to a function.
    func serve(customer customerProvider: () -> String) {
        print("Now serving \(customerProvider())!")
    }
    serve(customer: { customersInLine.remove(at: 0) } )


//  @autoclousure
//  Ahora puede llamar a la función como si tomara un argumento en lugar de un cierre.
    func serve(customer customerProvider: @autoclosure () -> String) {
        print("Now serving \(customerProvider())!")
    }
    serve(customer: customersInLine.remove(at: 0))


//  @escaping
    var customerProviders: [() -> String] = []
    func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
        customerProviders.append(customerProvider)
    }
    collectCustomerProviders(customersInLine.remove(at: 0))