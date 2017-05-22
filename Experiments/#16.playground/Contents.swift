/************************
 EXPERIMENT #16
 Write an enumeration that conforms to this protocol.
 このprotocolに準拠する列挙体を記述してください。
 ************************/

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()                                      //使うのがクラスだけであればmutatingは記述不要
}

enum ServerResponse : ExampleProtocol {
    
    case success(String, String)
    case timeout(Int)
    case failure(String)
    
    //var simpleDescription: String = "test"        //enumにstored propertyは宣言できない
    var simpleDescription: String {                 //computed propertyならできる。
        switch self {
        case let .success(sunrise, sunset):
            return "Sunrise is at \(sunrise) and sunset is at \(sunset)."
        case let .timeout(timeout):
            return "Request Timeout (\(timeout) sec)."
        case let .failure(message):
            return "Failure...  \(message)"
        }
    }
    
    func adjust(){
        print(simpleDescription)
    }
    
}

var response = ServerResponse.success("5:00", "19:00")
response.adjust()


