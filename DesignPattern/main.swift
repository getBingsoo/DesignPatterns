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

// 이놈은 뭐냐?? 이걸 추가하니까 타이머가 먹음 ..ㅡㅡ
// https://stackoverflow.com/questions/31944011/how-to-prevent-a-command-line-tool-from-exiting-before-asynchronous-operation-co
//RunLoop.main.run()


// MARK: Observer
print("===========OBSERVER===========")
let observer1 = Fan(name: "Lina")
let observer2 = Fan(name: "Nali")
let creator = Creator()
observer1.subscribe(creator: creator)
observer2.subscribe(creator: creator)
creator.eat()


// MARK: Command
print("===========COMMAND===========")
let lamp = Lamp()
let lampOnCommand = LampOnCommand(lamp: lamp)
let lampOffCommand = LampOffCommand(lamp: lamp)
let mySwitch = MySwitch(lampOnCommand: lampOnCommand, lampOffCommand: lampOffCommand)
mySwitch.switchOn()
mySwitch.switchOff()


// Command 교체 가능
print("--Command 교체--")
class NewLampOnCommand: Command {
	let lamp: Lamp

	init(lamp: Lamp) {
		self.lamp = lamp
	}

	func execute() {
		lamp.turnOn()
		lamp.blingBling() // 블링블링 추가 실행
	}
}
let newLampOnCommand = NewLampOnCommand(lamp: lamp)
mySwitch.setLampOnCommand(lampOnCommand: newLampOnCommand)
mySwitch.switchOn()
