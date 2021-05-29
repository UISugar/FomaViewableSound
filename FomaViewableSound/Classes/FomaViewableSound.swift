import Foundation

public class Foma:NSObject {
    public func sayHello(name:String) {
        print("\(name)","안녕하세요")
    }
    
    public func updateTest(isCompleted:Bool) {
        if isCompleted {
            print("업데이트 되었습니다!!")
        }
    }
}
