//
//  Command.swift
//  DesignPattern
//
//  Created by 60067667 on 2021/05/10.
//

import Foundation

/// 1. Command: 실행될 기능에 대한 인터페이스를 선언하는 객체
/// 커맨드 프로토콜 -> 할 일만 command로 캡슐화
protocol Command {
	func execute()
}

/// 2. ConcreteCommand: 실제로 실행되는 인터페이스를 구현하는 객체
class LampOnCommand: Command {

	private var lamp: Lamp

	init(lamp: Lamp) {
		self.lamp = lamp
	}

	func execute() {
		lamp.turnOn()
	}
}

class LampOffCommand: Command {

	private var lamp: Lamp

	init(lamp: Lamp) {
		self.lamp = lamp
	}

	func execute() {
		lamp.turnOff()
	}
}

/// 3. Receiver: ConcreteCommand에서 실행할 메서드를 구현할 때 필요한 클래스객체
class Lamp {
	func turnOn() {
		print("Lamp On")
	}

	func turnOff() {
		print("Lamp Off")
	}

	func blingBling() {
		print("Lamp BlingBling")
	}
}

class Alarm {
	func start() {
		print("Alarm Start")
	}
}

/// 4. Invoker: 기능의 실행을 요청하는 호출자 클래스 객체
/// 버튼 -> protocol 형식의 Command를 인자로 가지고있음
class MySwitch {

	private var lampOnCommand: Command
	private var lampOffCommand: Command

	init(lampOnCommand: Command, lampOffCommand: Command) {
		self.lampOnCommand = lampOnCommand
		self.lampOffCommand = lampOffCommand
	}

	func setLampOnCommand(lampOnCommand: Command) {
		self.lampOnCommand = lampOnCommand
	}

	func switchOn() {
		lampOnCommand.execute()
	}

	func switchOff() {
		lampOffCommand.execute()
	}
}

