//一般的な関数宣言
func greet(person: String, day: String) -> String {     //挨拶の関数、引数に挨拶の相手と日（曜日でもなんでもいい）
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")

/************************
 EXPERIMENT #07
 Remove the day parameter. Add a parameter to include today’s lunch special in the greeting.
 dayパラメータを削除してください。今日のスペシャルランチを挨拶に含めるためのパラメータを追加してくささい。
 ************************/

//Tupleを使った関数
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {    //括弧で括った変数の集合体のことをTupleという
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {           //渡された配列のうち、最小値、最大値、合計を返す
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)   //Tupleで宣言した変数で値が取得可能
print(statistics.2)     //0から数えたインデックスでの値の取得も可能

//可変引数を持った関数
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(numbers: 42,1,1)

/************************
 EXPERIMENT #08
 Write a function that calculates the average of its arguments.
 引数の平均を計算する関数を記述してください。
 ************************/

//ネスト関数
func returnFifteen() -> Int {
    var y = 10
    func add() {    //ネスト（入れ子）になった関数
        y += 5  //外部の変数（y）にアクセス可能
    }
    add()           //つくった関数を呼び出し
    return y            //add関数の実行により変更されたyを返す
}

returnFifteen()

//ネスト関数を戻り値として返す例
func makeIncrementer() -> ((Int) -> Int) {  // 戻り値がネスト関数（引数：Int、戻り値：Intのネスト関数）、関数の引数・戻り値を型とみなせる。
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}

var increment = makeIncrementer()  // var increment : ((Int) -> Int) = makeIncrementer() と同義

increment(7)

//他の関数を引数として渡す例
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)    //第二引数の関数をそのまま渡してる

//クロージャの記述例
numbers.map({ (number: Int) -> Int in   //numbersのそれぞれの要素を３倍にして、新たにArrayをつくる（numbersはそのまま）
    let result = 3 * number
    return result
})

/************************
 EXPERIMENT #09
 Rewrite the closure to return zero for all odd numbers.
 すべての奇数に対してゼロを返すようにクロージャを書き換えてください。
 ************************/

//もっと簡潔に
let mappedNumbers = numbers.map({ number in 3 * number })   //引数の型省略（型推論）、１行処理ならreturnも省略可能
print(mappedNumbers)

//引数も省略できちゃう
let sortedNumbers = numbers.sorted { $0 > $1 }  //急にでてきたArrayのsort関数、ここでは配列を大きい順にして変えす
print(sortedNumbers)

//（Swift Tour非掲載）こんな書き方もです。
var mappedNumbers2 = numbers.map() { 3 * $0 }     //クロージャがパラメータの最後の引数の場合、()の外に書ける。
print(mappedNumbers2)
var mappedNumbers3 = numbers.map { 3 * $0 }     //他に引数がないなら省略も可能。
print(mappedNumbers3)

//（Swift Tour非掲載）sortも丁寧に書くとこうなる
let sortedNumbers2 = numbers.sorted { (s1: Int, s2: Int) -> Bool in
    return s1 > s2
}
let sortedNumbers3 = numbers.sorted(by: >)  //一番短い書き方（まじか）
print(sortedNumbers3)
