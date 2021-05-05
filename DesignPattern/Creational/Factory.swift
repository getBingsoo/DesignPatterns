//
//  Factory.swift
//  DesignPatterns
//
//  Created by 60067667 on 2021/05/03.
//

import Foundation

protocol Environment {
	var identifier: String { get }
}

class DevEnvironment: Environment {
	var identifier: String { return "dev" }
}

class RealEnvironment: Environment {
	var identifier: String { return "real" }
}

class EnvironmentFactory {
	enum EnvType {
		case dev
		case real
	}

	static func create(type: EnvType) -> Environment {
		switch type {
		case .dev:
			return DevEnvironment()
		case .real:
			return RealEnvironment()
		}
	}
}
