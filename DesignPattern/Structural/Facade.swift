//
//  Facade.swift
//  DesignPattern
//
//  Created by 60067667 on 2021/05/05.
//

import Foundation

protocol Switch {
	func on()
	func off()
}

/**
전자레인지 예제
- 근데 이렇게 Switch 프로토콜로 통일감있게 모든걸 구현해도 되지만 이 자체가 Facade패턴은 아니다.
- 핵심은 뭔가 Microwave.on을 하면 Cooler.cooling 이라던가, Magnetron.work 라던가 다른 객체들의 여러가지 메소드를 얘가 한번에 실행해준다는것??
*/
class Microwave: Switch {
	let parts: [Switch] = [Cooler(), Magnetron(), TimeChecker()]

	func on() {
		parts.forEach { (part) in
			part.on()
		}
	}

	func off() {
		parts.reversed().forEach { (part) in
			part.off()
		}
	}
}


class Cooler: Switch {
	func on() {
		print("쿨러 작동 시작")
	}

	func off() {
		print("쿨러 작동 끝")
	}
}

class Magnetron: Switch {
	func on() {
		print("마이크로파 발생기 켜짐")
	}

	func off() {
		print("마이크로파 발생기 꺼짐")
	}
}

class TimeChecker: Switch {
	var timer: Timer?
	var count = 0

	func on() {
		print("타이머 켜짐")
//		guard timer == nil else { return }
//		timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] timer in
//			guard let self = self else { return }
//			guard timer.isValid else { return }
//			guard self.count < 10 else {
//				self.off()
//				return
//			}
//			print(self.count)
//			self.count += 1
//		}
	}

	func off() {
		print("타이머 정지")
//		self.timer?.invalidate()
//		self.timer = nil
	}
}
