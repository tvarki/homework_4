struct AnyStack {

    var anyStack : [Any]
    init(){
        anyStack = []
    }
    
    init(anyArray : [Any]){
        anyStack = anyArray
    }
    
    func getElement() -> Any? {
        guard anyStack.count > 0 else { return nil }
        return anyStack[anyStack.endIndex-1]
    }

    
    mutating func addElement(pasport : Any){
        anyStack.append(pasport)
    }
    
    
    mutating func remElement(){
        guard anyStack.count > 0 else {
            print("pStack is empty")
            return
        }
        anyStack.remove(at:anyStack.endIndex-1)
    }

    
    func getAllCOntent()->[Any]{
        return anyStack
    }
    
    
    func getSize()->Int{
        return anyStack.count
    }

    func printAll(){
        guard anyStack.count > 0 else {
            print( "error")
            return
        }
        print("------------------------")
        for element in anyStack{
            print("\(element)")
        }
    }
}

var anyArray : [Any] = []
 
anyArray.append("12333")
anyArray.append("123")
anyArray.append(22)
anyArray.append("ll")
anyArray.append(123.22)
anyArray.append(123.22)
anyArray.append(123.22)
anyArray.append([1,2,3,4,5])

var anyStack = AnyStack(anyArray: anyArray)

anyStack.printAll()
anyStack.remElement()
anyStack.printAll()
anyStack.remElement()
anyStack.printAll()
anyStack.remElement()
anyStack.printAll()


let anyElement: Any? = anyStack.getElement()

if anyElement == nil { //я бы использовал guard, но его нельзя использовать без return'a
    print("pStack is empty")
}else{
    print("\(anyElement!)")
}
