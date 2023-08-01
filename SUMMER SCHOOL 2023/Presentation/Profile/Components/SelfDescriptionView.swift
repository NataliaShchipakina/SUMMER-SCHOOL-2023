//
//  SelfDescriptionView.swift
//  SUMMER SCHOOL 2023
//
//  Created by Natalia Shchipakina on 01.08.2023.
//

import UIKit

struct SelfDescriptionViewModel {
    let titleSection: String
    let subTitleSection: String
}

class SelfDescriptionView: UICollectionReusableView {
    static let identifier = "SelfDescriptionView"
    
    // MARK: - UI
    
    private let titleSection: UILabel = {
        let title = UILabel()
        title.textAlignment = .left
        title.textColor = .black
        title.font = .systemFont(ofSize: 16)
        return title
    }()
    
    private let subTitleSection: UILabel = {
        let subTitle = UILabel()
        subTitle.textAlignment = .left
        subTitle.textColor = .black
        subTitle.font = .systemFont(ofSize: 14)
        subTitle.numberOfLines = 0
        return subTitle
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    func configure(with viewModel: SelfDescriptionViewModel) {
        titleSection.text = viewModel.titleSection
        subTitleSection.text = viewModel.subTitleSection
    }
}

// MARK: - Private

private extension SelfDescriptionView {
    func setupUI() {
        addSubview(titleSection)
        addSubview(subTitleSection)
    }
    
    func setupConstraints() {
        titleSection.translatesAutoresizingMaskIntoConstraints = false
        subTitleSection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleSection.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            titleSection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleSection.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            subTitleSection.topAnchor.constraint(equalTo: titleSection.bottomAnchor, constant: 8),
            subTitleSection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            subTitleSection.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            subTitleSection.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }
}

