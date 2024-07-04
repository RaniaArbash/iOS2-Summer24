import UIKit



func takeTimeFunction (completionHandler: @escaping (String)->Void ){

    var myQ = DispatchQueue(label: "MyQ")
    myQ.async {
        Thread.sleep(forTimeInterval: 30)// I don't know the time
        completionHandler("Done")
    }
    
 //  Thread.sleep(forTimeInterval: 30)// I don't know the time
    
}

takeTimeFunction { value in
    print(value)
}
