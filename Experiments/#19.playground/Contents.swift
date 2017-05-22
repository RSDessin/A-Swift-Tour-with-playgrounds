/************************
 EXPERIMENT #19
 Add code to throw an error inside the do block.
 What kind of error do you need to throw　so that the error is handled by the first catch block?
 What about the second and third blocks?
 sdoブロック内にエラーを投げるコードを追加してください。
 エラーが最初のcatchブロックによって処理されるようにするには、どのようなエラーを投げる必要がありますか？
 2番目と3番目のブロックはどうですか？
 ************************/


enum PrinterError: Error {  //Errorに準拠したプリンターエラーを定義
    case outOfPaper         //用紙切れ
    case noToner            //トナー切れ
    case onFire             //原因不明のエラーを昔のパソコン・プリンタは「燃えている」と表現したらしい。
}

enum UnknownError: Error {  //Errorに準拠したプリンターエラーを定義
    case unknown
}


do {
//    throw PrinterError.onFire
//    throw PrinterError.outOfPaper
    throw UnknownError.unknown
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print("Unknown error: \(error).")
}
