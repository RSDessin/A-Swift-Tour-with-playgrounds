/************************
 EXPERIMENT #05
 Try removing the default case. What error do you get?
 defaultのcaseを削除してみてください。どのようなエラーが出ますか？
 ************************/

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
//default:
//    print("Everything tastes good in soup.")
}

