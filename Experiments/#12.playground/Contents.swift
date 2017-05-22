/************************
 EXPERIMENT #12
 Write a function that compares two Rank values by comparing their raw values.
 rawValueを使って、2つのRankの値を比較する関数を記述してください。
 ************************/

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
    
    func compare(rank: Rank) -> String{
        
        if self.rawValue > rank.rawValue {
            return "\(self) is bigger than \(rank)."
        }else if self.rawValue < rank.rawValue {
            return "\(self) is smaller than \(rank)."
        }else{
            return "Both of them are the same."
        }
        
    }
    
}

let ten = Rank.ten
ten.compare(rank: .nine)
ten.compare(rank: .jack)
ten.compare(rank: .ten)


