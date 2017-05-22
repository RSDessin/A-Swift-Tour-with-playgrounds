/************************
 EXPERIMENT #10
 Add a constant property with let, and add another method that takes an argument.
 letで定数プロパティを追加してください。引数をとる別のメソッドを追加してください。
 ************************/

//Shape（図形）クラス
class Shape {
    let minimumOfSides = 3
    var numberOfSides = 0                       //プロパティ
    func simpleDescription() -> String {        //関数
        return "A shape with \(numberOfSides) sides."
    }

    func optionalDescription(prefix: String, suffix: String) -> String {
        if numberOfSides >= minimumOfSides {
            return "\(prefix) \(numberOfSides) \(suffix)."
        }else{
            return "This is not a polygon."
        }
    }
}

var shape = Shape()
shape.numberOfSides = 2
var shapeDescription = shape.optionalDescription(prefix: "This shape has", suffix: "sides")
