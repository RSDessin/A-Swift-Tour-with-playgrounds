/************************
 EXPERIMENT #20
 Modify the anyCommonElements(_:_:) function to make a function that returns an array of the elements
 that any two sequences have in common.
 anyCommonElementsを改修して、２つのシークエンスのうち、同じ要素を配列として返す関数にしてください。
 ************************/

func getCommonElements<T: Sequence, U: Sequence, V>(_ lhs: T, _ rhs: U) -> [V]
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element, T.Iterator.Element == V {
        
        var result = [V]()
        
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    result.append(rhsItem)
                }
            }
        }
        
        return result
        
}

func getCommonElements2<T: Sequence>(_ lhs: T, _ rhs: T) -> Array<T.Iterator.Element>
    where T.Iterator.Element: Equatable{
        
        var results = Array<T.Iterator.Element>()
        
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    results.append(rhsItem)
                }
            }
        }
        
        return results
        
}

getCommonElements([1, 2, 3, 4, 5, 6,9], [3, 5, 9])
getCommonElements2([1, 2, 3, 4, 5, 6,9], [3, 5, 9])

