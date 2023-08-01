//
//  ProfileRouter.swift
//  SUMMER SCHOOL 2023
//
//  Created by Natalia Shchipakina on 01.08.2023.
//

import UIKit

protocol IProfileRouter { }

final class ProfileRouter: IProfileRouter {
    
    weak var transitionHandler: UIViewController?
    
    // MARK: - IProfileRouter
}
