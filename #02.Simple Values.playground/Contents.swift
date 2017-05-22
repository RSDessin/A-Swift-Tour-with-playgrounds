//変数と定数（varとlet）
var myVariable = 42
myVariable = 50
let myConstant = 42     //後で値を変更しようとするエラーになる。
//myConstant = 50

//型推論（代入された値から自動的に型が決まる。）
let implicitInteger = 70    //Int
let implicitDouble = 70.0   //Floatにはならず、デフォルトでDoubleになる。
//type(of :implicitDouble)  //実際に型を確認してみる。

let explicitDouble: Double = 70 //型の明示

/************************
 EXPERIMENT #01
 Create a constant with an explicit type of Float and a value of 4.
 明示的なFloat型で、値4を持つ定数を作成してください。
 ************************/

//型変換（暗黙ではやってくれない）
let label = "The width is "
let width = 94
let widthLabel = label + String(width)

/************************
 EXPERIMENT #02
 Try removing the conversion to String from the last line. What error do you get?
 最後の行からStringへの変換を削除してみてください。どのようなエラーが出ますか？
 ************************/

//バックスラッシュと小括弧を使った文字列への値の代入
//整数演算を含めた文字列
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

/************************
 EXPERIMENT #03
 Use \() to include a floating-point calculation in a string and to include someone’s name in a greeting.
 \()を使って、
 1. 浮動小数点演算を含めた文字列
 2. 誰かの名前を含めた挨拶文
 を作成してください。
 ************************/

//配列の生成、呼び出し、値の変更
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

//辞書の生成、呼び出し、値の変更
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]

occupations["Jayne"] = "Public Relations"

//空の配列生成、辞書生成
let emptyArray = [String]()
let emptyDictionary = [String: Float]()

//空の配列生成、辞書生成の推論
shoppingList = []
occupations = [:]
