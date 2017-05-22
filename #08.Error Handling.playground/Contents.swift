//Errorプロトコルに準拠した列挙型を定義して、処理にあわせたエラーを返すのが一般的
enum PrinterError: Error {  //Errorに準拠したプリンターエラーを定義
    case outOfPaper         //用紙切れ
    case noToner            //トナー切れ
    case onFire             //原因不明のエラーを昔のパソコン・プリンタは「燃えている」と表現したらしい。
}

func send(job: Int, toPrinter printerName: String) throws -> String {   //throws：sendメソッドの呼び出し元にエラーを上位スローするという宣言
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner      //トナー切れをsendメソッドの呼び出し元に伝える
    }
    return "Job sent"   //エラー発生時は到達しない
}

//sendメソッドの呼び出し元
do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")    //try：このメソッドはエラーを投げる
    print(printerResponse)
} catch {
    print(error)
}

/************************
 EXPERIMENT #18
 Change the printer name to "Never Has Toner", so that the send(job:toPrinter:) function throws an error.
 send(job:toPrinter:)関数がエラーを投げるように、printer nameを"Never Has Toner"に変更してください。
 ************************/

//複数のエラー処理を取り扱う場合。switch文のように書ける。
do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {                                           //
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

/************************
 EXPERIMENT #19
 Add code to throw an error inside the do block.
 What kind of error do you need to throw　so that the error is handled by the first catch block?
 What about the second and third blocks?
 sdoブロック内にエラーを投げるコードを追加してください。
 エラーが最初のcatchブロックによって処理されるようにするには、どのようなエラーを投げる必要がありますか？
 2番目と3番目のブロックはどうですか？
 ************************/

//do-catchに変わるエラーの処理方法（Converting Errors to Optional Values）
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")    //Optional（?）とすることでエラー発生時はnilを変えるようにする。
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

//------------------------------------
//↑これと同じ処理をdo-catchで書くとこうなる（載ってません）
//let printerFailure2: String?
//do {
//    printerFailure2 = try send(job: 1885, toPrinter: "Never Has Toner")
//} catch {
//    printerFailure2 = nil
//}
//------------------------------------

//deferはJavaだったらfinallyに近い処理をする。
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

//defer：保留、後回しの意。
func fridgeContains(_ food: String) -> Bool {   //冷蔵庫の在庫チェック
    fridgeIsOpen = true         //冷蔵庫を開ける
    defer {                     //deferブロック内はfridgeContains内で、エラー発生の有無に関わらず必ず処理される。
        fridgeIsOpen = false    //冷蔵庫を閉める。これで開けっ放しにはならない。
    }
    let result = fridgeContent.contains(food)   //食材があるか確認
    return result
}
fridgeContains("banana")    //バナナあるのか（なかった）
print(fridgeIsOpen)         //冷蔵庫はちゃんと閉めたよ

//------------------------------------
//エラー処理ならこう使う
//let printerFailure3: String?
//do {
//    defer {                 //Javaと異なりcatchの次には書かない。
//        //なんらかの後処理
//        print("printerFailure3 was nil.")   //エラーになっても絶対にやらなくてはならない処理を書く（DBからの切断、ファイルのクローズなど）
//    }
//    print("printerFailure3 error.")
//    printerFailure3 = try send(job: 1885, toPrinter: "Never Has Toner")
//} catch {
//    print("printerFailure3 caught.")
//    printerFailure3 = nil
//}
//------------------------------------
