//
//  FlowCoordinator.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 19.12.2021.
//
// swiftlint:disable trailing_whitespace

import UIKit

protocol Coordinator {
    
    var containerViewController: UIViewController? { get set }
    
    @discardableResult
    func createFlow() -> UIViewController
}
