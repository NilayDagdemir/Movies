//
//  PersonDetailView.swift
//  Movies
//
//  Created by Eda Nilay DAĞDEMİR on 19.12.2020.
//  Copyright © 2020 Eda Nilay DAĞDEMİR. All rights reserved.
//

import UIKit

class PersonDetailView: UIView {
    private var profilePhoto = UIImageView(contentMode: .scaleToFill)
    private var nameLabel = UILabel(font: .boldSystemFont(ofSize: 18), textColor: .black)
    private var knownForDepartmentLabel = UILabel(font: .italicSystemFont(ofSize: 14), textColor: .darkGray)
    private var biographyTextView = UITextView(font: .systemFont(ofSize: 14, weight: .regular), textColor: .darkGray)
    private var birthdayLabel = UILabel(font: .italicSystemFont(ofSize: 14), textColor: .darkGray)
    private var placeOfBirthLabel = UILabel(font: .italicSystemFont(ofSize: 14), textColor: .darkGray)

    private var personDetailItem: PersonDetail?

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with personDetailItem: PersonDetail) {
        self.personDetailItem = personDetailItem
        backgroundColor = .paleGrey

        nameLabel.text = "Name: \(personDetailItem.name)"
        knownForDepartmentLabel.text = "\(personDetailItem.knownForDepartment)"
        biographyTextView.text = personDetailItem.biography == "" ? "**No biography exists for this one**" : "\(personDetailItem.biography)"
        birthdayLabel.text = "Birthday: \(personDetailItem.birthday)"
        placeOfBirthLabel.text = "Place of birth: \(personDetailItem.placeOfBirth)"

        ImageDownloadManager.shared.downloadImageForImageView(url: Config.getPosterURL(with: personDetailItem.profilePath,
                                                                                           resolution: Constants.PosterProperties.high.resolution),
                                                                                           imageView: profilePhoto)
    }

    private func configureUI() {
        backgroundColor = .paleGrey
        preservesSuperviewLayoutMargins = false
        profilePhoto.clipsToBounds = true
        profilePhoto.contentMode = .scaleToFill
        biographyTextView.isEditable = false
        biographyTextView.adjustsFontForContentSizeCategory = true

        add(subviews: profilePhoto, nameLabel, knownForDepartmentLabel, biographyTextView, birthdayLabel, placeOfBirthLabel)
        setupConstraints()
    }

    private func setupConstraints() {
        setProfilePhotoConstraints()
        setNameLabelConstraints()
        setKnownForDepartmentLabelConstraints()
        setBiographyTextViewConstraints()
        setBirthdayLabelConstraints()
        setPlaceOfBirthLabelConstraints()
    }

    private func setProfilePhotoConstraints() {
        profilePhoto.translatesAutoresizingMaskIntoConstraints = false
        profilePhoto.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        profilePhoto.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        profilePhoto.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        profilePhoto.heightAnchor.constraint(equalToConstant: 432).isActive = true
    }

    private func setNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: profilePhoto.leadingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: profilePhoto.trailingAnchor, constant: -10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func setKnownForDepartmentLabelConstraints() {
        knownForDepartmentLabel.translatesAutoresizingMaskIntoConstraints = false
        knownForDepartmentLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        knownForDepartmentLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 0).isActive = true
        knownForDepartmentLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: -10).isActive = true
        knownForDepartmentLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func setBiographyTextViewConstraints() {
        biographyTextView.translatesAutoresizingMaskIntoConstraints = false
        biographyTextView.topAnchor.constraint(equalTo: knownForDepartmentLabel.bottomAnchor, constant: 10).isActive = true
        biographyTextView.leadingAnchor.constraint(equalTo: knownForDepartmentLabel.leadingAnchor, constant: -7).isActive = true
        biographyTextView.trailingAnchor.constraint(equalTo: knownForDepartmentLabel.trailingAnchor, constant: -10).isActive = true
        biographyTextView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func setBirthdayLabelConstraints() {
        birthdayLabel.translatesAutoresizingMaskIntoConstraints = false
        birthdayLabel.topAnchor.constraint(equalTo: biographyTextView.bottomAnchor, constant: 10).isActive = true
        birthdayLabel.leadingAnchor.constraint(equalTo: knownForDepartmentLabel.leadingAnchor, constant: 0).isActive = true
        birthdayLabel.trailingAnchor.constraint(equalTo: knownForDepartmentLabel.trailingAnchor, constant: -10).isActive = true
        birthdayLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func setPlaceOfBirthLabelConstraints() {
        placeOfBirthLabel.translatesAutoresizingMaskIntoConstraints = false
        placeOfBirthLabel.topAnchor.constraint(equalTo: birthdayLabel.bottomAnchor, constant: 10).isActive = true
        placeOfBirthLabel.leadingAnchor.constraint(equalTo: birthdayLabel.leadingAnchor, constant: 0).isActive = true
        placeOfBirthLabel.trailingAnchor.constraint(equalTo: birthdayLabel.trailingAnchor, constant: -10).isActive = true
        placeOfBirthLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
