import Foundation

// Квадратне рівняння
func solveSquareEqution (a: Double, b: Double, c:Double) -> String {
    let d = b * b - 4 * a * c
    let x1 = ( -b + sqrt(d) ) / (2 * a)
    let x2 = ( -b - sqrt(d) ) / (2 * a)
    
    let conditionDescription = "Квадратне рівняння: \"\(a)x² + \(b) + \(c) = 0\""
    let resolution = "корені: \nx₁= \(x1)\nx₂= \(x2)"
    
    return conditionDescription + "\n" + resolution
}

// Площа циліндра
func solveCylinderArea (r: Double, h: Double) -> String{
    let pi = 3.14
    let s = 2 * pi * r * r + 2 * pi * r * h
    
    let conditionDescription = "Радіус: \(r), Висота: \(h) "
    let cylinderArea = "Площа циліндра: \(s)"
    
    return conditionDescription + "\n" + cylinderArea
}

//Об'єм прямокутного паралелепіпеда
func solveParallelepipedVolume (a: Double, b: Double, h: Double) -> String{
    let v = a * b * h
    
    let conditionDescription = "Довжина: \(a), Ширина: \(b), Висота: \(h) "
    let parallelepipedVolume = "Об'єм прямокутного паралелепіпеда: \(v)"
    
    return conditionDescription + "\n" + parallelepipedVolume
}

print(
    solveParallelepipedVolume(a: 10, b: 5, h: 3)
)

print(
    solveCylinderArea(r: 2, h: 10)
)

print(
    solveSquareEqution(a: 2, b: 6, c: 1)
)
