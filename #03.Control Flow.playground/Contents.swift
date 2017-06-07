//for文、if文
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {         //statementはBool値を返すようにする if score {..はエラー（if score == 0 {..と同義としてくれない）
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

//if letによる値の存在チェック
var optionalString: String? = "Hello"   //?は、この値はOptional(＝"選択肢がある"、転じて"nilも取りうる"という意味）
print(optionalString == nil)            //nilとは何も値が入っていないこと。

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {    //optionalNameに値があれば（nilではなかったら）括弧内の処理を実行するという意
    greeting = "Hello, \(name)"
}

/************************
 EXPERIMENT #04
 Change optionalName to nil. What greeting do you get?
 Add an else clause that sets a different greeting if optionalName is nil.
 optionalNameをnilに変更してください。どんな挨拶を受けますか？
 optionalNameがnilの場合、別の挨拶を設定するelse節を追加してください。
 ************************/

//??演算子を使った書き方
let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)" //もしnickNameがnilなら、fullnameを入力。

//Switch文
let vegetable = "red pepper"
switch vegetable {                                      //数値だけじゃなくて文字も可能
case "celery":
    print("Add some raisins and make ants on a log.")
    //fallthrough //処理を続行したい場合
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):                 //単純な値比較だけでなく、複雑な比較演算もできる
    print("Is it a spicy \(x)?")
    //break　//Swiftでは書かなくてもよくなった
default:
    print("Everything tastes good in soup.")
}

/************************
 EXPERIMENT #05
 Try removing the default case. What error do you get?
 defaultのcaseを削除してみてください。どのようなエラーが出ますか？
 ************************/

//Dictionayのループ処理
//例：どの項目の配列が一番大きい値をもっているかをチェックする処理

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],      //順序の担保はないので、ループ処理をするとどの順に処理されるかは決まっていない
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]

var largest = 0

for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}

print(largest)

/************************
 EXPERIMENT #06
 Add another variable to keep track of which kind of number was the largest, as well as what that largest number was.
 別の変数を追加して、どの種類の番号が最大であったのか、その最大番号が何であったのかを追跡してください。
 ************************/

//while文
var n = 2
while n < 100 {
    n *= 2 // n = n * 2
}
print(n)

//repeat-while文
var m = 2
repeat {
    m *= 2
} while m < 100     //条件判定が最後にあるので、ループ処理は確実に１回は処理される。
print(m)

//for文
var total = 0

//Objective-Cであれば、for(i=0;i<4;i++){.. みたいな書き方になるけど、Swift2.0から使えなくなった
for i in 0..<4 {    //"..<"を"..."にすれば for(i=0;i<=4;i++){..と同じ意味になる
    total += i      //total = total + i
}

print(total)
