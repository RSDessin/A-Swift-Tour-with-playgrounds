/************************
 EXPERIMENT #14
 Add a third case to ServerResponse and to the switch.
 3番目のケースをServerResponseとswitchに追加してください。
 ************************/

//case Valueに独自の引数を持たせることもできる
enum ServerResponse {
    case success(String, String)
    case timeout(Int)
    case failure(String)
}

//サーバー処理の結果を取得
//let result = ServerResponse.success("6:00 am", "8:09 pm")       //サーバー処理が成功し、成功した結果を返す場合を想定
//let result = ServerResponse.failure("Out of cheese.")          //サーバー処理が失敗し、失敗した旨のメッセージを返す場合を想定
let result = ServerResponse.timeout(120)

//サーバー処理の結果を出力
switch result {
case let .success(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .timeout(timeout):
    print("Request Timeout (\(timeout) sec).")
case let .failure(message):
    print("Failure...  \(message)")
}

