//
//  SkillCollectionViewCell.swift
//  SUMMER SCHOOL 2023
//
//  Created by Natalia Shchipakina on 01.08.2023.
//

import UIKit

struct SkillCollectionViewCellViewModel {
    let title: String
    let deleteButtonIsHidden: Bool
    let deleteButtonHandler: (() -> ())?
}

class SkillCollectionViewCell: UICollectionViewCell {
    static let identifier = "SkillCollectionViewCell"

//    MARK: - UI
    
    private let skillLabel: UILabel = {
        let skillLabel = UILabel()
        skillLabel.textColor = .black
        skillLabel.font = .systemFont(ofSize: 14)
        return skillLabel
    }()
    
    private let deleteButton: UIButton = {
        let deleteButton = UIButton()
        let image = UIImage(named: "delete")
        deleteButton.setImage(image, for: .normal)
        return deleteButton
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [skillLabel, deleteButton])
        stackView.axis = .horizontal
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func configure(with viewModel: SkillCollectionViewCellViewModel) {
        skillLabel.text = viewModel.title
        deleteButton.isHidden = viewModel.deleteButtonIsHidden
    }
}

private extension SkillCollectionViewCell {
    func commonInit() {
        setupUI()
        setupConstraints()
    }

    
    func setupUI() {
        backgroundColor = .clear
        contentView.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 245/255, alpha: 1)
        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true
        contentView.addSubview(stackView)
    }
    
    func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
}
