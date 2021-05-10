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
		// coordinator을 통해 화면 전환
		coordinator?.moveFirstVC()
	}
}

