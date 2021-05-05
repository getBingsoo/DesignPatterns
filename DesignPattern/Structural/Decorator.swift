//
//  Decorator.swift
//  DesignPatterns
//
//  Created by 60067667 on 2021/05/03.
// http://minsone.github.io/programming/designpattern-decorator
//

import Foundation

// 1. Component: 추상 클래스로 데코레이터로 감싸져 사용될 수 있음.
protocol Coffee {
	func getCost() -> Double
	func getIngredients() -> String
}

// 2. Concrete Component: 인터페이스를 동적으로 추가함.
class SimpleCoffee: Coffee {
	func getCost() -> Double {
		return 5000
	}

	func getIngredients() -> String {
		return "원두"
	}
}

// 3. Decorator: Decorator 안에는 Component 객체를 가짐. 자신이 장식할 구성요소와 같은 인터페이스 또는 추상 클래스를 구현함.
class CoffeeDecorator: Coffee, CustomStringConvertible {
	/// Decorator 안의 Component 객체
	let coffee: Coffee

	required init(coffee: Coffee) {
		self.coffee = coffee
	}

	func getCost() -> Double {
		return coffee.getCost()
	}

	func getIngredients() -> String {
		return coffee.getIngredients()
	}

	var description: String {
		return "COST: \(getCost()), INGREDIENTS: \(getIngredients())"
	}
}

// 4. ConcreteDecorator: Decorator가 감싸고 있는 Component 객체를 위한 인스턴트 변수가 있어 Component 상태를 확장할 수 있음.
class Milk: CoffeeDecorator {
	required init(coffee: Coffee) {
		super.init(coffee: coffee)
	}

	override func getCost() -> Double {
		return super.getCost() + 1000
	}

	override func getIngredients() -> String {
		return super.getIngredients() + ", Milk"
	}
}

class ChocoPowder: CoffeeDecorator {
	required init(coffee: Coffee) {
		super.init(coffee: coffee)
	}

	override func getCost() -> Double {
		return super.getCost() + 1000
	}

	override func getIngredients() -> String {
		return super.getIngredients() + ", ChocoPowder"
	}
}




// 다른 예 - 하다 말음..
class RoadDisplay {
	func draw() {
		print("도로 표시")
	}
}

class RoadDisplayWithLane: RoadDisplay {
	override func draw() {
		super.draw()
		self.drawLane()
	}

	func drawLane() {
		print(" + 차선 표시")
	}
}

