import Foundation

func solveSquare(a: Double, b: Double, c: Double) -> String{
    let discriminant = b * b - 4 * a * c
    
    if discriminant < 0 {
        return "Квадратне рівняння: \"\(a)x2 + \(b)x + \(c) = 0\"\nРішення: немає"
    }
    else {
        
        let x1 = (-b + sqrt(discriminant)) / (2 * a)
        let x2 = (-b - sqrt(discriminant)) / (2 * a)
        
        return "Квадратне рівняння: \"\(a)x2 + \(b)x + \(c) = 0\"\nРішення: x1 = \(x1), x2 = \(x2)"
    }
}

print(solveSquare(a: 4, b: 8, c: 12))

func solveVolumeCilinder(r: Double, h: Double) -> String{
    let volume = Double.pi * (r*r) * h
    
    return "Обʼєм циліндра: \"P * \(r)2 * \(h)\"\nРішення: = \(volume)"
}

print(solveVolumeCilinder(r: 4, h: 8))
