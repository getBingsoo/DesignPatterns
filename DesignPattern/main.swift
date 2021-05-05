//
//  main.swift
//  DesignPattern
//
//  Created by 60067667 on 2021/05/05.
//

import Foundation

// MARK: Factory
print("===========FACTORY===========")
let devEnv = EnvironmentFactory.create(type: .dev) // dev를 넣어서 객체 생성
let realEnv = EnvironmentFactory.create(type: .real) // real을 넣어서 객체 생성
print(devEnv.identifier)
print(realEnv.identifier)

// MARK: Decorator
print("===========DECORATOR===========")
var coffee = CoffeeDecorator(coffee: SimpleCoffee())
print("simple Coffee: \(coffee)")
coffee = Milk(coffee: coffee)
print("add Milk: \(coffee)")
coffee = ChocoPowder(coffee: coffee)
print("add ChocoPowder: \(coffee)")

// MARK: Adapter
print("===========ADAPTER===========")
Client.callApi(target: Adapter())

// MARK: Facade
print("===========FACADE===========")
let microwave = Microwave()
microwave.on()
microwave.off()

// MARK: Observer
print("===========OBSERVER===========")
let observer1 = Fan(name: "Lina")
let observer2 = Fan(name: "Nali")
let creator = Creator()
observer1.subscribe(creator: creator)
observer2.subscribe(creator: creator)
creator.eat()


// 이놈은 뭐냐?? 이걸 추가하니까 타이머가 먹음 ..ㅡㅡ
// https://stackoverflow.com/questions/31944011/how-to-prevent-a-command-line-tool-from-exiting-before-asynchronous-operation-co
//RunLoop.main.run()
