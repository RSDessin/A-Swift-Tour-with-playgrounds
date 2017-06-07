/************************
 EXPERIMENT #17
 Write an extension for the Double type that adds an absoluteValue property.
 Double型に、absoluteValueプロパティを追加するExtensionを記述してください。
 ************************/

import Foundation

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

extension Double: ExampleProtocol {     //プロトコル準拠しないとExtensionが使えないわけではない。s
    
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    var absoluteValue: Double {
        return fabs(self)
    }
    
    mutating func adjust() {
        self += 42.0
    }
    
}

print((-7).absoluteValue)
print(-7.absoluteValue)
print(-1 * 7.absoluteValue)
