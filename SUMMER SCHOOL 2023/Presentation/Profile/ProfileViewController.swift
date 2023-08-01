//
//  ProfileViewController.swift
//  SUMMER SCHOOL 2023
//
//  Created by Natalia Shchipakina on 01.08.2023.
//

import UIKit

protocol IProfileView: AnyObject { }

class ProfileViewController: UIViewController {
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()

    // MARK: - Dependecies
    
    private let presenter: IProfilePresenter
    
    // MARK: - Init
    
    init(presenter: IProfilePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupUI()
        presenter.viewDidLoad()
    }
}

extension ProfileViewController: IProfileView { }

// MARK: Private

private extension ProfileViewController {
    func setupUI() {
        title = "Профиль"
        view.backgroundColor = .systemBackground
    }
    
    func setupConstraints() { }
}
