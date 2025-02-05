//
//  CustomTableViewCell.swift
//  UITable
//
//  Created by Александр Семёнов on 05.02.2025.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    
    private enum Constants {
        static let margin: CGFloat = 16
        static let buttonSize: CGFloat = 44
        static let plusImage = UIImage(systemName: "plus")
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapButtuon), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var action: (() -> Void)? = nil
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.margin)
        ])
    }
    
    private func setupButton() {
        contentView.addSubview(button)
        button.frame.size.width = Constants.buttonSize
        button.frame.size.height = Constants.buttonSize
        button.setImage(Constants.plusImage, for: .normal)
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.margin),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.margin),
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.margin)
        ])
    }
    
    @objc
    private func didTapButtuon() {
        guard let action = action else { return }
        action()
    }
    
    func configure(with model: CustomTableViewCellModel) {
        label.text = model.text
        action = model.action
    }
}

struct CustomTableViewCellModel {
    let text: String
    let action: (() -> Void)?
    
    init(text: String, action: (() -> Void)? = nil) {
        self.text = text
        self.action = action
    }
}
