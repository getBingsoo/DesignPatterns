//
//  Singleton.swift
//  DesignPatterns
//
//  Created by 60067667 on 2021/05/03.
//

import Foundation

// 싱글톤
// 1. final하게 만들기
// 2. private init

// 문제점?
// 싱글톤 인스턴스가 너무 많은 일을 하거나 많은 데이터를 공유시킬 경우 다른 클래스의 인스턴스들 간에 결합도가 높아져 "개방-폐쇄 원칙" 을 위배하게 된다.

final class MySingleton {
	private init() {}
	static let shared = MySingleton()

	func hello() {
		print("hello")
	}
}
