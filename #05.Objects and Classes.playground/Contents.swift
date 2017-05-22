//Shape（図形）クラス
class Shape {
    var numberOfSides = 0                       //プロパティ
    func simpleDescription() -> String {        //関数
        return "A shape with \(numberOfSides) sides."
    }
}

/************************
 EXPERIMENT #10
 Add a constant property with let, and add another method that takes an argument.
 letで定数プロパティを追加してください。引数をとる別のメソッドを追加してください。
 ************************/

var shape = Shape()                                 //インスタンスの生成
shape.numberOfSides = 7                             //プロパティ、メソッドへのアクセスはピリオド("."）で
var shapeDescription = shape.simpleDescription()

//イニシャライザーはinit関数で行う
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

//クラスの継承
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)          //親クラスを呼ぶ
        numberOfSides = 4               //親クラスのプロパティ、名前の重複がなかったらselfをつけなくても呼べる
    }
    
    func area() -> Double {             //自クラスのメソッド
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {           //親クラスを上書き
        return "A square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

/************************
 EXPERIMENT #11
 Make another subclass of NamedShape called Circle that takes a radius and a name as arguments to its initializer.
 Implement an area() and a simpleDescription() method on the Circle class. 
 CircleというNamedShapeの別のサブクラスを作成し、半径(radius)と名前(name)をinitializerの引数としてください。
 Circleクラスには、area()メソッドとsimpleDescription()メソッドを実装してくささい。
 ************************/

//プロパティのgetとset
class EquilateralTriangle: NamedShape {
    
    var sideLength: Double = 0.0    //Stored Property
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    //プロパティの値を指定した時、または値を取得する時の処理を書ける
    var perimeter: Double {              //perimeter：周囲長の意。
        get {
            return 3.0 * sideLength     //一辺を３倍にして返す
        }
        set{
            sideLength = newValue / 3.0 //newValueは予約語、渡された値が入ってくる。周囲長から一辺の長さを求める。
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
    
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)   //周囲長
triangle.perimeter = 9.9
print(triangle.sideLength)  //一辺の長さ


//willSetとdidSet。値をセットする前後で何らかの処理を入れたい時に使う。
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            print("TriangleAndSquare.triangle.willSet")
            square.sideLength = newValue.sideLength     //triangleの一辺の長さを変える前に、squareの長さを変更する。
        }
    }
    var square: Square {
        willSet {
            print("TriangleAndSquare.square.willSet")
            triangle.sideLength = newValue.sideLength   //squareの一辺の長さを変える前に、triangleの長さを変更する。
        }
    }
    
    init(size: Double, name: String) {
        print("TriangleAndSquare.init")
        square = Square(sideLength: size, name: name)                   //初期値設定の時はwillSet,didSetは呼ばれない
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape") //TriangleAndSquareのインスタンス生成
print(triangleAndSquare.square.sideLength)                                      //TriangleAndSquare.initでセットされた値
print(triangleAndSquare.triangle.sideLength)                                    //TriangleAndSquare.initでセットされた値
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")        //squareに値をセット
print(triangleAndSquare.triangle.sideLength)                                    //TriangleAndSquare.square.willSetでセットされた値

//Optional Chaining
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")  //クラスの場合も変数のオプショナルと同様
let sideLength = optionalSquare?.sideLength
//type(of :sideLength)
