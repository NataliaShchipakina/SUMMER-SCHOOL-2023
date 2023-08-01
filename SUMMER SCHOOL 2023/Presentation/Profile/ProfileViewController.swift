//
//  ProfileViewController.swift
//  SUMMER SCHOOL 2023
//
//  Created by Natalia Shchipakina on 01.08.2023.
//

import UIKit

protocol IProfileView: AnyObject { }

class ProfileViewController: UIViewController {
    
    // MARK: - UI
    
    private var dataSource = ["MVP", "SURF", "SOLID", "PATTERNS", "MVI"]
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.headerReferenceSize = CGSize(width: 100, height: 300)
        layout.footerReferenceSize = CGSize(width: 100, height: 100)

        
        let collectionView = UICollectionView(
            frame: CGRect(origin: .zero, size: self.view.frame.size),
            collectionViewLayout: layout
        )
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(SkillCollectionViewCell.self, forCellWithReuseIdentifier: SkillCollectionViewCell.identifier)
        collectionView.register(
            ProfileSectionHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: ProfileSectionHeaderView.identifier
        )
        collectionView.register(
            SelfDescriptionView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: SelfDescriptionView.identifier
        )
        
        return collectionView
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
        setupConstraints()
        presenter.viewDidLoad()
    }
}

extension ProfileViewController: IProfileView { }

// MARK: Private

private extension ProfileViewController {
    func setupUI() {
        title = "Профиль"
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
    }
    
    
    func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SkillCollectionViewCell.identifier, for: indexPath) as! SkillCollectionViewCell
        let model = dataSource[indexPath.row]
        cell.configure(with: SkillCollectionViewCellViewModel(title: model, deleteButtonIsHidden: false, deleteButtonHandler: nil))
        
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: ProfileSectionHeaderView.identifier,
                for: indexPath
            ) as! ProfileSectionHeaderView
            
            header.configure(with: ProfileSectionHeaderModel(
                avatarImage: UIImage(named: "avatar")!,
                name: "Щипакина Наталья Игоревна",
                selfDescription: "iOS Developer",
                city: "Саранск"
            ))
            
            return header
            
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SelfDescriptionView.identifier,
                for: indexPath
            ) as! SelfDescriptionView
            
            footer.configure(with: SelfDescriptionViewModel(
                titleSection: "О себе",
                subTitleSection: "Experienced software engineer skilled in developing scalable and maintainable systems"
            ))
            
            return footer
        default:
            fatalError()
        }

    }
}

extension ProfileViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            self.collectionView.performBatchUpdates {
                self.collectionView.deleteItems(at: [indexPath])
                self.dataSource.remove(at: indexPath.row)
            }
        }

    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {

}
