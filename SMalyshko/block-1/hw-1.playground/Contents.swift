import UIKit

func resolveSqEq(a: Double, b: Double, c: Double) {
    let d = (b * b) - (4 * a * c);
    
    let x1 = (-b + sqrt(d)) / (2 * a);
    
    let x2 = (-b - sqrt(d)) / (2 * a);
    
    let result = "D = \(d) \n x1 = \(x1) \n x2 = \(x2)"
    
    print(result)
}

resolveSqEq(a: 2, b: 100, c: 3)

func getCylinderVolume(radius: Double, height: Double) -> Double {
    let result = Double.pi * radius * radius * height;
    
    return result;
}

let cylinderVolume = getCylinderVolume(radius: 5, height: 10);
print(cylinderVolume);

func getParalelepipedVolume(width: Double, lenght: Double, height: Double) -> Double {
    let result = width * lenght * height;
    return result
}

let paralelepipedVolume = getParalelepipedVolume(width: 4, lenght: 6, height: 10);
print(paralelepipedVolume);

func getCycleArea(radius: Double) -> Double {
    let result = Double.pi * radius * radius;
    return result;
}

let cycleArea = getCycleArea(radius: 9);
print(cycleArea)

func getRectangleArea(width: Int, height: Int) -> Int {
    width * height;
}

let rectangleArea = getRectangleArea(width: 10, height: 20);
print(rectangleArea)


