//
//  RouterMain.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 27.12.2023.
//

import UIKit

protocol RouterMain {
    
    var navigationController: UINavigationController { get set }
    var assemblyBuilder: AssemblyBuilderProtocol { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showListCities()
    func popToRoot()
    func alert(title: String, message: String, btnTitle: String, action: @escaping (() -> Void))
}

final class Router: RouterProtocol {
    
    var navigationController: UINavigationController
    
    var assemblyBuilder: AssemblyBuilderProtocol
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        let mainList = assemblyBuilder.createMain(router: self)
        navigationController.viewControllers = [mainList]
    }
    
    func showListCities() {
        let listCities = assemblyBuilder.createListCities(router: self)
        navigationController.pushViewController(listCities, animated: true)
    }
    
    func popToRoot() {
        navigationController.popViewController(animated: true)
    }
    
    func alert(title: String, message: String, btnTitle: String, action: @escaping (() -> Void)) {
        let alertController = assemblyBuilder.createAlert(
            title: title,
            message: message,
            btnTitle: btnTitle,
            action: action)
        navigationController.present(alertController, animated: true)
    }
}
