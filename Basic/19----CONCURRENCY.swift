//  Para indicar que una función o método es asincrónico, escriba la palabra clave en su declaración después de sus parámetros
    
    func listPhotos(inGallery name: String) async -> [String] {
        let result = // ... some asynchronous networking code ...
        return result
    }

//  Al llamar a un método asincrónico, la ejecución se suspende hasta que ese método vuelve
    let photoNames = await listPhotos(inGallery: "Summer Vacation")
    let sortedNames = photoNames.sorted()
    let name = sortedNames[0]
    let photo = await downloadPhoto(named: name)
    show(photo)

//  Secuencias asíncronas
//  potencialmente suspende la ejecución al comienzo de cada iteración, cuando está esperando que el siguiente elemento esté disponible
    import Foundation

    let handle = FileHandle.standardInput
    for try await line in handle.bytes.lines {
        print(line)
    }

//  Asincronas en paralelo
//  En este ejemplo, las tres llamadas se iniciarán sin esperar a que se complete la anterior.
    async let firstPhoto = downloadPhoto(named: photoNames[0])
    async let secondPhoto = downloadPhoto(named: photoNames[1])
    async let thirdPhoto = downloadPhoto(named: photoNames[2])


    let photos = await [firstPhoto, secondPhoto, thirdPhoto]
    show(photos)

//  Actores
// obliga a que se use con away

    actor TemperatureLogger {
        let label: String
        var measurements: [Int]
        private(set) var max: Int


        init(label: String, measurement: Int) {
            self.label = label
            self.measurements = [measurement]
            self.max = measurement
        }
    }
    let logger = TemperatureLogger(label: "Outdoors", measurement: 25)
    print(await logger.max) // Prints "25"