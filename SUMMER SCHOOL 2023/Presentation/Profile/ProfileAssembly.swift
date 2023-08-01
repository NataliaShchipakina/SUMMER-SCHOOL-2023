//
//  ProfileAssembly.swift
//  SUMMER SCHOOL 2023
//
//  Created by Natalia Shchipakina on 01.08.2023.
//

import UIKit

protocol IProfileAssembly {
    func assemble() -> UIViewController
}

final class ProfileAssembly: IProfileAssembly {

    // MARK: - IHomeAssembly
    
    func assemble() -> UIViewController {
        let router = ProfileRouter()
        let presenter = ProfilePresenter(router: router)
        let viewController = ProfileViewController(presenter: presenter)
        
        router.transitionHandler = viewController
        presenter.view = viewController

        return viewController
    }
}

