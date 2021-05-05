//
//  Observer.swift
//  DesignPattern
//
//  Created by 60067667 on 2021/05/05.
//

import Foundation

class Fan {
	var creator: Creator?
	var name: String

	init(name: String) {
		self.name = name
	}

	func subscribe(creator: Creator) {
		self.creator = creator
		creator.fans.append(self)
	}

	func alarm(_ message: String) {
		print("\(self.name)가 message를 받았다: \(message)")
	}
}

class Creator {
	var fans: [Fan] = []

	func eat() {
		print("밥을먹는다")
		notify("eat")
	}

	func study() {
		notify("study")
	}

	func sleep() {
		notify("sleep")
	}

	func notify(_ message: String) {
		fans.forEach { fan in
			fan.alarm(message)
		}
	}
}
