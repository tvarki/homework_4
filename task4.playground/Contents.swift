import UIKit



protocol QueueProtocol {
    associatedtype T
    var count : Int {get}
    mutating func add(_ item: T)
    mutating func removeFirst() -> T?
}

struct GenericQueue<Element> : QueueProtocol {
    
    typealias T = Element
    
    var items = [Element]()
    
    mutating func add(_ item: Element) {
        items.append(item)
    }
    
    mutating func removeFirst() -> Element? {
        guard items.count > 0 else { return nil }
        return items.removeFirst()
    }
    
    var count: Int {
        return items.count
    }
}


extension GenericQueue where Element : Equatable{
     func contains(_ value: Element) -> Bool {
        for item in items {
            if value == item {
                return true
            }
        }
        return false
    }
    
    func getFirst()->Element?{
        guard items.count > 0 else { return nil }
        return items[0]
        
    }
}


extension GenericQueue where Element : Numeric{
    func sumOfFirstAndLast() -> Element? {
        guard items.count > 0 else {return nil}
        return items[0] + items[items.count-1]
    }
}







var  tmpQueue  = GenericQueue<Int>()


tmpQueue.add(1)
tmpQueue.sumOfFirstAndLast()

tmpQueue.getFirst()
tmpQueue.add(2)

tmpQueue.removeFirst()
tmpQueue.getFirst()

tmpQueue.add(3)


tmpQueue.contains(2)


tmpQueue.removeFirst()
tmpQueue.add(4)
tmpQueue.add(5)

tmpQueue.sumOfFirstAndLast()
tmpQueue.count



var  tmpStringQueue  = GenericQueue<String>()
tmpStringQueue.add("1234")
tmpStringQueue.add("qwerty")
tmpStringQueue.add("asdfg")



//----------------------------------------------------
// все что дальше - я делал до лекции по дженерикам =(

struct AnyStack {
    
    var anyStack : [Any?]
    
    
    
    init(anyArray : [Any?]){
        //        guard anyArray != nil else {
        //            print("Cant initialize by nil array")
        //            return
        //        }
        print("Initialize with \(anyArray)")
        anyStack = anyArray
    }
    
    func getElement() -> Any? {
        guard anyStack.count > 0 else { return nil }
        return anyStack[anyStack.endIndex-1]
    }
    
    
    mutating func addElement(any : Any?){
        //        guard any != nil else {
        //            print("Cant add nil to array")
        //            return
        //        }
        
        print(" +Add item \(String(describing: any))")
        anyStack.append(any)
    }
    
    
    mutating func remElement(){
        guard anyStack.count > 0 else {
            print("pStack is empty")
            return
        }
        print(" -Remove item \(String(describing: anyStack[anyStack.endIndex-1]))")
        anyStack.remove(at:anyStack.endIndex-1)
    }
    
    
    func getAllCOntent()->[Any?]{
        print("getAllCOntent")
        return anyStack
    }
    
    
    func getSize()->Int{
        return anyStack.count
    }
    
    func printAll(){
        guard anyStack.count > 0 else {
            print( "error - pStack is empty")
            return
        }
        print("-----------printAll-------------")
        for element in anyStack{
            print("\(String(describing: element))")
        }
    }
}


var anyArray : [Any?] = []
anyArray.append("12333")
anyArray.append("123")
anyArray.append(22)
anyArray.append("ll")
anyArray.append(123.22)
anyArray.append(123.22)
anyArray.append(123.22)
anyArray.append([1,2,3,4,5])
anyArray.append(nil)

var anyStack = AnyStack(anyArray: anyArray)



extension AnyStack{
    init(){
        anyStack = []
    }
}

//var anyStack = AnyStack()


anyStack.addElement(any: "1221")


struct tmp {
    var test: String
    var testInt: Int
    init(test:String, int:Int){
        self.test = test
        self.testInt = int
    }
}
var tt = tmp(test:"qwe",int:1)


let tttmp : Int? = nil

anyStack.addElement(any: tt)

anyStack.addElement(any: tttmp)


anyStack.printAll()
anyStack.remElement()
anyStack.printAll()
anyStack.remElement()
anyStack.printAll()
anyStack.remElement()
anyStack.printAll()


anyStack.remElement()
anyStack.remElement()
anyStack.remElement()
anyStack.remElement()
anyStack.remElement()
anyStack.remElement()
anyStack.printAll()


print("----------------------")
func run(){
    guard let element  = anyStack.getElement() else{
        print("nil")
        return
    }
    print("\(element)")
}
run()

anyStack.remElement()
run()
