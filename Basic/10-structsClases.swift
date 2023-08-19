    struct Resolution {
        var width = 0
        var height = 0
    }
    class VideoMode {
        var resolution = Resolution()
        var interlaced = false
        var frameRate = 0.0
        var name: String?
    }

/// INSTANCIAS
    let someResolution = Resolution()
    let someVideoMode = VideoMode()

    print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

/// Memberwise Initializers .. TIPO VALOR
    let vga = Resolution(width: 640, height: 480)
    let hd = Resolution(width: 1920, height: 1080)
    var cinema = hd
/// Las clases son tipos de referencia asi que cambie el valor en ambos
    let tenEighty = VideoMode()
    tenEighty.resolution = hd
    tenEighty.interlaced = true
    tenEighty.name = "1080i"
    tenEighty.frameRate = 25.0

    let alsoTenEighty = tenEighty
    alsoTenEighty.frameRate = 30.0

    if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
    // Prints "tenEighty and alsoTenEighty refer to the same VideoMode instance."
    }
