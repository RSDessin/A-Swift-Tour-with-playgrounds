/************************
 EXPERIMENT #09
 Rewrite the closure to return zero for all odd numbers.
 すべての奇数に対してゼロを返すようにクロージャを書き換えてください。
 ************************/

var numbers = [1,2,3,4,5,6,7,8,9,10,11]

numbers.map({ (number: Int) -> Int in
    if number % 2 == 1 {
        return 0
    }else{
        return number
    }
})


//    実際によく使われる例
//    WEB APIのGETリクエスト・レスポンス（Alamofireを使用、 https://github.com/Alamofire/Alamofire ）
//
//    Alamofire.request("https://httpbin.org/get").responseJSON { response in
//        print(response.request)  // original URL request
//        print(response.response) // HTTP URL response
//        print(response.data)     // server data
//        print(response.result)   // result of response serialization
//
//        if let JSON = response.result.value {
//            print("JSON: \(JSON)")
//        }
//    }
