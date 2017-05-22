/************************
 EXPERIMENT #13
 Add a color() method to Suit that returns “black” for spades and clubs, and returns “red” for hearts and diamonds.
 スペード、クローバーの場合は"黒"、ハート、ダイヤモンドの場合は"赤"を返すcolor()メソッドをSuitに追加してください。
 ************************/

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
    
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts,.diamonds:
            return "red"
        }
    }
    
}

let spades = Suit.spades
let spadesColor = spades.color()

