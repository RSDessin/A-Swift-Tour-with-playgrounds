/************************
 EXPERIMENT #06
 Add another variable to keep track of which kind of number was the largest, as well as what that largest number was.
 別の変数を追加して、どの種類の番号が最大であったのか、その最大番号が何であったのかを追跡してください。
 ************************/

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],      //順序の担保はないので、ループ処理をするとどの順に処理されるかは決まっていない
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
    "Cude": [1, 8, 27, 64, 125, 216]    //追加
]

var key = ""
var largest = 0

for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            key = kind
            largest = number
        }
    }
}

print("\(key) : \(largest)")
