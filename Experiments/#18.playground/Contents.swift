/************************
 EXPERIMENT #18
 Change the printer name to "Never Has Toner", so that the send(job:toPrinter:) function throws an error.
 send(job:toPrinter:)関数がエラーを投げるように、printer nameを"Never Has Toner"に変更してください。
 ************************/

enum PrinterError:Error {  //Errorに準拠したプリンターエラーを定義
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
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")    //try：このメソッドはエラーを投げる
    print(printerResponse)
} catch {
    print("Printer Error: \(error)")
}

