/************************
 EXPERIMENT #03
 Use \() to include a floating-point calculation in a string and to include someone’s name in a greeting.
 \()を使って、
 1. 浮動小数点演算を含めた文字列
 2. 誰かの名前を含めた挨拶文
 を作成してください。
 ************************/

let weight = 60.7
let height = 167.1 / 100
let bmi = "Your BMI is \(weight / (height * height))."

let name = "Joanna"
let greeting = "Hello, \(name)."

//応用
import Foundation

let bmi2 = "Your BMI is \(weight / pow(height,2))."
let bmi4 = "Your BMI is \((weight / pow(height,2)*10).rounded()/10)."





