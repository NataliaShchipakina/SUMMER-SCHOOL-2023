//
//  ProfileSectionHeader .swift
//  SUMMER SCHOOL 2023
//
//  Created by Natalia Shchipakina on 01.08.2023.
//

import UIKit

struct ProfileSectionHeaderModel {
    let avatarImage: UIImage
    let name: String
    let selfDescription: String
    let city: String
}

class ProfileSectionHeaderView: UICollectionReusableView {
    static let identifier = "ProfileSectionHeaderView"
    
    // MARK: - UI
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 60
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let selfDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(red: 148/255, green: 147/255, blue: 153/255, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(red: 148/255, green: 147/255, blue: 153/255, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
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
    
    func configure(with viewModel: ProfileSectionHeaderModel) {
        avatarImageView.image = viewModel.avatarImage
        nameLabel.text = viewModel.name
        cityLabel.attributedText = attributedTitle(for: viewModel.city)
        selfDescriptionLabel.text = viewModel.selfDescription
    }
}

// MARK: - Private

private extension ProfileSectionHeaderView {
    func setupUI() {
        backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 245/255, alpha: 1)
        addSubview(avatarImageView)
        addSubview(nameLabel)
        addSubview(selfDescriptionLabel)
        addSubview(cityLabel)
    }
    
    func setupConstraints() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        selfDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            avatarImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 51),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -51),
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            selfDescriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            selfDescriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 51),
            selfDescriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -51),
            selfDescriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: selfDescriptionLabel.bottomAnchor, constant: 4),
            cityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 51),
            cityLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -51),
            cityLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
    }
    
    func attributedTitle(for city: String) -> NSAttributedString {
        let cityNameString = NSMutableAttributedString(string: city)

        let locationImage = NSTextAttachment()
        locationImage.image = UIImage(named: "location")
        let fullAttributtedString = NSMutableAttributedString(attachment: locationImage)
        fullAttributtedString.append(cityNameString)
        
        return fullAttributtedString
    }
}
