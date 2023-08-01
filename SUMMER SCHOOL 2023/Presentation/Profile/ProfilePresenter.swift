//
//  ProfilePresenter.swift
//  SUMMER SCHOOL 2023
//
//  Created by Natalia Shchipakina on 01.08.2023.
//

import Foundation

protocol IProfilePresenter {
    func viewDidLoad()
}

final class ProfilePresenter: IProfilePresenter {
    
    // MARK: - Dependencies
    
    private let router: IProfileRouter
      
    weak var view: IProfileView?
    
    // MARK: - Init
    
    init(router: IProfileRouter) {
        self.router = router
    }
    
    // MARK: - IProfilePresenter
    
    func viewDidLoad() { }
}

// MARK: - Private

private extension ProfilePresenter { }
