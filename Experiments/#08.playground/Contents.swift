/************************
 EXPERIMENT #08
 Write a function that calculates the average of its arguments.
 引数の平均を計算する関数を記述してください。
 ************************/

func averageOf(numbers: Int...) -> Double {
    
    if numbers.count == 0 {
        return 0
    }
    
    var sum = 0
    for number in numbers {
        sum += number
    }
    
    return Double(sum) / Double(numbers.count)
    
}

averageOf()
averageOf(numbers: 1, 2, 3, 4, 5, 6)

