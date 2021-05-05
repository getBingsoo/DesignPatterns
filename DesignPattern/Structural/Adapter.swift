//
//  Adapter.swift
//  DesignPatterns
//
//  Created by 60067667 on 2021/05/03.
// https://joycestudios.tistory.com/33
//

import Foundation

// Client -> Adapter: Target(Protocol) -> Adaptee 이런 형태

// 사용방법
// 1. 어떤 공통 작업 ex) request를 가진 protocol을 만든다. -> 이것이 Target
// 2. 공통 작업을 준수하는 실제 Adpater Class를 만든다. Adaptee(어떤API인지)를 지정해주고 request안에 Adaptee를 사용하는 내용 작성.
// 3. Client에서 Adapter 만들어서 호출

// 확장하려면: 1. Target을 준수하는 MyAdapter생성 & 구현 2. Client에서는 MyAdapter 객체를 만들고 메소드를 호출한다.
protocol Target {
	func request() -> String
}

class Adaptee {
	func someApiMethod() -> String {
		return "API Return Value"
	}
}

class Adapter: Target {
	private let adaptee = Adaptee()

	func request() -> String {
		let returnValue = adaptee.someApiMethod()
		return returnValue
	}
}

class Client {
	/// target을 준수하는 객체를 넣어주면 내용이 뭔지는 모르고 target.request하면 된다.
	static func callApi(target: Target) {
		print(target.request())
	}
}
