import SwiftUI

// Reference: https://twitter.com/natpanferova/status/1536264063922995200

extension Equatable {
    func isEqual(_ other: any Equatable) -> Bool {
        print("-------------")
        print("join isEqual, the other:", other)
        guard let other = other as? Self else {
            print("as? faild, Want Type: \(Self.self), self: \(self)")
            return false
        }
        print("guard success, Want Type: \(Self.self), self: \(self)")
        let result = other == self
        return result
    }
}

func areEqual(first: Any, second: Any) -> Bool {
    guard
        let equatableOne = first as? any Equatable,
        let equatableTwo = second as? any Equatable
    else { return false }
    return equatableOne.isEqual(equatableTwo)
}

class BaseAnimal: Equatable {
    var name: String = ""
    
    init(name: String) {
        self.name = name
    }
    
    public static func == (left: BaseAnimal, right: BaseAnimal) -> Bool {
        return left.name == right.name
    }
}

class Dog: BaseAnimal {
    var runSpeed: Int = 100
}

class Bird: BaseAnimal {
    var flySpeed: Int = 999
}

let dog = Dog(name: "sweet")
let dog2 = Dog(name: "sweet")
let bird = Bird(name: "sweet")
let result = areEqual(first: dog, second: bird)
print("dog areEqual bird:", result)
print()
let result2 = areEqual(first: dog, second: dog2)
print("dog areEqual dog2:", result2)
print()

print("dog == bird:", dog == bird)
print()
print("dog == dog2:", dog == dog2)
