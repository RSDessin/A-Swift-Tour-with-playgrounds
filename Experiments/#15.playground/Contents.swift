/************************
 EXPERIMENT #15
 Add a method to Card that creates a full deck of cards, with one card of each combination of rank and suit.
 rankとsuitのそれぞれの組み合わせを1枚のカードとして、トランプ一式を返すメソッドを追加してください。
 ヒント1：Card構造体の配列を戻り値とする関数をつくる
 → こんな関数：static func fullDeck() -> [Card] { .... ）、関数の呼び方：Card.fullDeck()
 ヒント2：rawValueを扱うので、"enum Suit {..." は "enum Suit: Int {..." と修正したほうがよい。
 ************************/

enum Rank: Int {
    case ace = 1                                //rawValueの先頭値を与える（省略時はゼロ）
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {        //クラスと同様にメソッドがつくれる
        switch self {
        case .ace:                              //変数（？）にもアクセスできる。
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
    
}

enum Suit : Int {       //型を指定（rawValueが必要）
    case spades = 1, hearts, diamonds, clubs    //便宜上初期値を1とする。
    func simpleDescription() -> String {
        switch self {
        case .spades:
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

struct Card {
    
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    static func fullDeck() -> [Card] {
        
        var deck = [Card]()
        
//        for i in 1...13 {
//            if let rank = Rank(rawValue: i) {
//                for j in 1...4 {
//                    if let suit = Suit(rawValue: j) {
//                        deck.append(Card(rank: rank, suit: suit))
//                    }
//                }
//            }
//        }
        
        var i = 1
        
        while let rank = Rank(rawValue: i){
            var j = 1
            while let suit = Suit(rawValue: j){
                deck.append(Card(rank: rank, suit: suit))
                j = j + 1
            }
            i = i + 1
        }
        
        return deck
        
    }
    
}

Card.fullDeck()




