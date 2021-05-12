import UIKit

// MARK -  Protocol + Extension

protocol StampAppendable {
    var stampColor: UIColor { get }
    func addStamps(stamps: [UIView])
}
extension StampAppendable where Self: UIView {
    func addStamps(stamps: [UIView]) {
        // stampleri framelerini belirle
        // rengini, kenarlarını vs ayarla
        stamps.forEach({ addSubview($0) })
        stamps.forEach({ $0.backgroundColor = stampColor })
    }
    var stampColor: UIColor { .blue }
}

class AView: UIView, StampAppendable {
    var stampColor: UIColor { .green }
    
    func addStamps(stamps: [UIView]) {
        print("sadasd")
    }
}

class BView: UIView, StampAppendable { }

let aView = AView()
aView.addStamps(stamps: [])

let bView = BView()
bView.addStamps(stamps: [])


// MARK -  Protocol + Dispatching
protocol Person {
    var sleepTime: Int { get }
}

extension Person {
    var sleepTime: Int { 8 }
}

struct LazyPerson: Person {
    var sleepTime: Int { 10 }
}

let lazyPerson = LazyPerson()
//print(lazyPerson.sleepTime)


// MARK -  Protocol + Extension
protocol Container {
    associatedtype Element: Numeric
    
    var items: [Element] { get set }
    mutating func append(_ element: Element)
    
    var sumOfItems: Element { get }
}

extension Container {
    mutating func append(_ element: Element) {
        items.append(element)
    }
    
    var sumOfItems: Element { items.reduce(0, +) }
}

struct Storage<T: Numeric>: Container {
    var items: [T] = []
}

var storageInstance = Storage<Double>()
storageInstance.append(5.3)
storageInstance.append(1.1)
print(storageInstance.sumOfItems)

