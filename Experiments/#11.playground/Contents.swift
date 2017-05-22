/************************
 EXPERIMENT #11
 Make another subclass of NamedShape called Circle that takes a radius and a name as arguments to its initializer.
 Implement an area() and a simpleDescription() method on the Circle class.
 CircleというNamedShapeの別のサブクラスを作成し、半径(radius)と名前(name)をinitializerの引数としてください。
 Circleクラスには、area()メソッドとsimpleDescription()メソッドを実装してくささい。
 ************************/

import Foundation

class NamedShape {
    var numberOfSides: Int = 0
    let name: String
    
    init(name: String) {
        self.name = name        //selfを用いて、クラス変数と引数を区別する
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    deinit {                    //deinitで終了処理
        //※Play Groundではdeinitは呼ばれません※
    }
}

class Circle: NamedShape {
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)          //親クラスを呼ぶ
    }
    
    func area() -> Double {             //自クラスのメソッド
        return pow(radius, 2) * .pi
    }
    
    override func simpleDescription() -> String {           //親クラスを上書き
        return "\(name) with radius of length \(radius)."
    }
    
}

let circle = Circle(radius: 2.0, name: "my test circle")
circle.area()
circle.simpleDescription()
