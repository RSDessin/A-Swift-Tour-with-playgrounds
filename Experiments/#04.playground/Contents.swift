/************************
 EXPERIMENT #04
 Change optionalName to nil. What greeting do you get?
 Add an else clause that sets a different greeting if optionalName is nil.
 optionalNameをnilに変更してください。どんな挨拶を受けますか？
 optionalNameがnilの場合、別の挨拶を設定するelse節を追加してください。
 ************************/

var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {    //optionalNameに値があれば（nilではなかったら）括弧内の処理を実行するという意
    greeting = "Hello, \(name)"
}else{
    greeting = "Hello, everyone."
}


