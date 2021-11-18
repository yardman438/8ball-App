//
//  SettingsScreenTableViewCell.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 18.11.2021.
//
// swiftlint:disable trailing_whitespace

import UIKit
import SnapKit

class SettingsScreenTableViewCell: UITableViewCell {
    static let identifier = L10n.identifier
    
    private let customAnswerLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(asset: Asset.textColor)
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(customAnswerLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureLabel(text: String) {
        customAnswerLabel.text = text
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        customAnswerLabel.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        customAnswerLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView.snp.centerY)
            make.leading.equalTo(contentView.snp.leading).inset(16)
        }
    }
}
