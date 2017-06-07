enum Rank: Int {
    
    case ace = 1                                //rawValueの先頭値を与える（省略時はゼロ）
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {        //クラスと同様にメソッドがつくれる
        switch self {
        case .ace:                              //変数（？）にもアクセスできる。
            return "A"
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        default:
            return String(self.rawValue)
        }
    }
    
}

let ace = Rank.ace                  //つくった列挙型そのものを返す
let aceRawValue = ace.rawValue      //列挙型の生データ（Int）を返す
type(of: ace)
type(of: aceRawValue)
ace.simpleDescription()

/************************
 EXPERIMENT #12
 Write a function that compares two Rank values by comparing their raw values.
 rawValueを使って、2つのRankの値を比較する関数を記述してください。
 ************************/

//Rankデータの生成。init?(rawValue:)でできる。
if let convertedRank = Rank(rawValue: 3) {      //Optional Bindingによるチェックもできちゃう
    let threeDescription = convertedRank.simpleDescription()
}

//特にrawValueは意味をなさない場合（Rank（トランプのカード）みたいに1から始める必要が特にない、など）は、rawValueをセットする必要はない。
enum Suit {
    case spades, hearts, diamonds, clubs    //特に初期値を与える必要はない
    func simpleDescription() -> String {
        switch self {           //selfはSuitを指している
        case .spades:           //省略した記述（self.spades、Suit.spadesと一緒）
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}

let hearts = Suit.hearts            //Suit列挙型のcase valueであることを明記
let heartsDescription = hearts.simpleDescription()

/************************
 EXPERIMENT #13
 Add a color() method to Suit that returns “black” for spades and clubs, and returns “red” for hearts and diamonds.
 スペード、クローバーの場合は"黒"、ハート、ダイヤモンドの場合は"赤"を返すcolor()メソッドをSuitに追加してください。
 ************************/

//case Valueに独自の引数を持たせることもできる
enum ServerResponse {
    case result(String, String)
    case failure(String)
}

//サーバー処理の結果を取得
let success = ServerResponse.result("6:00 am", "8:09 pm")       //サーバー処理が成功し、成功した結果を返す場合を想定
let failure = ServerResponse.failure("Out of cheese.")          //サーバー処理が失敗し、失敗した旨のメッセージを返す場合を想定

//サーバー処理の結果を出力
switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
}

/************************
 EXPERIMENT #14
 Add a third case to ServerResponse and to the switch.
 3番目のケースをServerResponseとswitchに追加してください。
 ************************/

//struct
//classととてもよく似ているが、structは値渡し、classは参照渡し。またstructは継承ができない仕様。

struct Card{
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

//------------------------------------
//違いを示す例（載ってません）
//class CardClass {
//    var rank: Rank
//    init(rank: Rank) {
//        self.rank = rank
//    }
//}
//
//struct CardStruct {
//    var rank: Rank
//    init(rank: Rank) {
//        self.rank = rank
//    }
//}
//
//let class1 = CardClass(rank: .ace)
//var class2 = class1                     //参照
//class1.rank = .two
//print("class1: \(class1.rank), class2: \(class2.rank)")         //同じ実体を参照しているので同じ値になってる
//
//var struct1 = CardStruct(rank: .ace)    //letだとエラー
//var struct2 = struct1                   //コピー
//struct1.rank = .two
//print("struct1: \(struct1.rank), struct2: \(struct2.rank)")     //実体をコピーしているので異なった値になってる
//------------------------------------

/************************
 EXPERIMENT #15
 Add a method to Card that creates a full deck of cards, with one card of each combination of rank and suit.
 rankとsuitのそれぞれの組み合わせを1枚のカードとして、トランプ一式を返すメソッドをCard構造体に追加してください。
 ヒント1：Card構造体の配列を戻り値とする関数をつくる
 → こんな関数：static func fullDeck() -> [Card] { .... ）、関数の呼び方：Card.fullDeck()
 ヒント2：rawValueを扱うので、"enum Suit {..." は "enum Suit: Int {..." と修正したほうがよい。
 ************************/
