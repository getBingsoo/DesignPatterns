//
//  Coordinator.swift
//  DesignPattern
//
//  Created by 60067667 on 2021/05/07.
//

import Foundation

/// UIKit import 안돼서 임의로 만든 struct
open class UINavigateController {
	func pushViewController(_ viewController: UIViewController) {
		print("push")
	}
}
open class UIViewController {}



/// MainCoordinator을 만드는 기반 Protocol. 한국말로 조정자..
protocol Coordinator {
	/// 자식 Coordinator들
	var childCoordinators: [Coordinator] { get }

	/// navigate를 해주는 녀석
	///
	/// AppDelegate가 MainCoordinator을 가지고, MainCoordinator가 navigationController을 가진다.
	/// 이 때 navigationController은 AppDelegate의 keyWindow의 window.rootViewController이다.
	var navigationController: UINavigateController { get }

	/// 화면을 이동시켜주는 메소드.
	func start()
}

/// 메인이 되는 Coordinator
class MainCoordinator: Coordinator {

	var childCoordinators: [Coordinator] = []

	var navigationController: UINavigateController

	init(navigateController: UINavigateController) {
		self.navigationController = navigateController
	}

	// 앱의 시작화면을 정해주는..
	func start() {
		let vc = BaseViewController()
		vc.coordinator = self
		navigationController.pushViewController(vc)
	}

	func moveFirstVC() {
		let vc = FirstViewController()
		vc.coordinator = self
		navigationController.pushViewController(vc)
	}
}

class BaseViewController: UIViewController {

	weak var coordinator: MainCoordinator?
}

class FirstViewController: BaseViewController {

	/// 버튼을 눌렀다고 가정하고 vc를 이동하자.
	func touchSomething() {
		// 방법 1: coordinator을 가지고 있고 이걸 통해 화면 전환
		coordinator?.moveFirstVC()
	}
}

// 방법 2: protocol을 호출하고 coordinator에서는 protocol을 구현
protocol SecondViewControllerDelegate {

	func touchSomething()
}

class SecondViewController: UIViewController {

	var delegate: SecondViewControllerDelegate?

	func touchSomething() {
		delegate?.touchSomething()
	}
}

class SecondCoordinator: Coordinator, SecondViewControllerDelegate {

	var childCoordinators: [Coordinator] = []

	var navigationController: UINavigateController

	init(navigationController: UINavigateController) {
		self.navigationController = navigationController
	}

	func start() {
		let vc = SecondViewController()
		vc.delegate = self
		self.navigationController.pushViewController(vc)
	}

	func touchSomething() {
		// do something
	}

}
