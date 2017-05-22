//プロトコル＝規約の意、JavaのInterfaceに該当
//クラス、列挙型、構造型の挙動を決定するテンプレートのようなもの。
//プロトコルに従うクラス、列挙型、構造型は、プロトコルに宣言されたプロパティ、メソッドを実装しなくてはならない
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()                                      //使うのがクラスだけであればmutatingは記述不要
}

class SimpleClass: ExampleProtocol {                            //プロトコルの実装宣言
    var simpleDescription: String = "A very simple class."      //実装しないとエラー
    var anotherProperty: Int = 69105                            //クラス独自のプロパティ
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    //SimpleStructureのプロパティsimpleDescriptionを変化させる処理のため、mutatingの宣言が必要。
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
    
    //    func adjust() {
    //        print(simpleDescription + simpleDescription)       //プロパティの値を変えないのでmutating宣言は不要
    //    }
    
}

var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

/************************
 EXPERIMENT #16
 Write an enumeration that conforms to this protocol.
 このprotocolに準拠する列挙体を記述してください。
 ************************/

//エクステンション＝拡張の意
//既存の型に独自のプロパティやメソッドを追加する。
extension Int: ExampleProtocol {            //Int型に、ExampleProtocolに従って新しいプロパティとメソッドを追加する。
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}

print(7.simpleDescription)
//print(7.adjust())   //エラー、7はリテラルなので変えられない、変数への代入が必要。

/************************
 EXPERIMENT #17
 Write an extension for the Double type that adds an absoluteValue property.
 Double型に、absoluteValueプロパティを追加するExtensionを記述してください。
 ************************/

//ExampleProtocolとして宣言可、ExampleProtocolを実装したSimpleClassを代入できる。
//どのクラスでも、ExampleProtocolに従っていれば代入可能。
let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
// print(protocolValue.anotherProperty)  // Uncomment to see the error：プロトコルにないプロパティ、メソッドにはアクセスできない
