import Foundation

//MARK: - Квадратне рівняння
func SolveSquareEquation(a: Double, b: Double, c:Double) -> String {
    if a == 0 {
        return " Це не квадратне рівняння, тому що а = 0"
    }
    
    let d = b * b - 4 * a * c
    let conditionDescription = "Квадратне рівняння: \"\(a)x2 + \(b)x + \(c) = 0\""
    
    if d > 0 {
        let x1 = ( -b + sqrt(d) ) / (2 * a)
        let x2 = ( -b - sqrt(d) ) / (2 * a)
        return "\(conditionDescription)\n Корені: \nx1 = \(x1) \nx2 = \(x2)"
        
    } else if d == 0 {
        let x = -b / (2 * a)
        return "\(conditionDescription)\n Корінь: \nx = \(x)"
        
    } else {
        return "\(conditionDescription)\n Корені рівняння відсутні"
        }
    }
print(SolveSquareEquation(a: 0, b: 2, c: 3))

//MARK: - Функція для визначення обʼєму паралелепіпеда

func CalculateVolumeofParalelepipedia(lenght: Double, wight: Double, hight: Double) -> String {
    let v = lenght * wight * hight
    return "Обʼєм паралелепіпеда: \(v)"
}
print(CalculateVolumeofParalelepipedia(lenght: 4, wight: 5, hight: 6))

