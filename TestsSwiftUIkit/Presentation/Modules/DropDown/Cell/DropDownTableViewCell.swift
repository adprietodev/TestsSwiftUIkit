//
//  DropDownTableViewCell.swift
//  TestsSwiftUIkit
//
//  Created by Adrian Prieto Villena on 7/6/24.
//

import UIKit

class DropDownTableViewCell: UITableViewCell {
    static let identifier = "DropDownTableViewCell"

    let customLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(customLabel)
        
        NSLayoutConstraint.activate([
            customLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            customLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            customLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

