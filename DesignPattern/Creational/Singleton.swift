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
final class MySingleton {
	private init() {}
	static let shared = MySingleton()

	func hello() {
		print("hello")
	}
}
