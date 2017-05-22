/************************
 EXPERIMENT #07
 Remove the day parameter. Add a parameter to include today’s lunch special in the greeting.
 dayパラメータを削除してください。今日のスペシャルランチを挨拶に含めるためのパラメータを追加してくささい。
 ************************/

let consumptionTax = 1.08

func greet(person: String, lunchSpecial: String, price: Int) -> String {
    let priceWithConsumptionTax = Int(Double(price) * consumptionTax)
    return "Hey \(person), today’s lunch special is \(lunchSpecial). It's \(priceWithConsumptionTax)yen."
}

greet(person: "Bob", lunchSpecial: "Penne Arrabiata", price: 800)

