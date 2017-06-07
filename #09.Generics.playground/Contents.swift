//generic："包括的、全体的"の意。いかなる型にも使えるメソッドが作れる。
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {  //Itemがどんな型もとりうる。Itemという名前じゃなくてもいい。
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

makeArray(repeating: "knock", numberOfTimes:4)  //型推論でString型のジェネリクスメソッドとなっている。
makeArray(repeating: 1, numberOfTimes:6)  //型推論でInt型のジェネリクスメソッドとなっている。
makeArray(repeating: 1.5, numberOfTimes:4)  //型推論でDouble型のジェネリクスメソッドとなっている。

//余談ですが実は前述のArrayやDictionaryもGenerics
//let emptyArray2 = [String]()                      //さっき出たやつ
//let emptyDictionary2 = [String: Float]()
//let emptyArray3 = Array<String>()                 //こんな書き方もできる。（ジェネリクスだとよくわかりますよね？）
//let emptyDictionary3 = Dictionary<String,Float>()

//enumでもつかえるよ
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

//where句をつけてジェネリクスの前提条件を設けることができる
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool            //Sequence：配列を提供する型
    //配列の各要素の片がEquatableプロトコルに準拠、且つTとUの各要素は同じ型
    //Equatable：自作のクラスや型を"=="演算子で比較できるようにするプロトコル
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        
        //lhsとrhsの要素を比較し、同じものがあったらtrueを返す。（この処理を行いたいからwhereの前提条件が必要でした）
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
}

anyCommonElements([1, 2, 3], [3])

/************************
 EXPERIMENT #20
 Modify the anyCommonElements(_:_:) function to make a function that returns an array of the elements
 that any two sequences have in common.
 anyCommonElementsを改修して、２つのシークエンスのうち、同じ要素を配列として返す関数にしてください。
 ************************/
