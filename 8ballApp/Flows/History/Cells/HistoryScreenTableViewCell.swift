//
//  HistoryScreenTableViewCell.swift
//  8ballApp
//
//  Created by Sergey Dvornik on 24.11.2021.
//
// swiftlint:disable trailing_whitespace

import UIKit
import SnapKit

class HistoryScreenTableViewCell: UITableViewCell {
    static let identifier = L10n.historyIdentifier
    
    private let answerHistoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(asset: Asset.textColor)
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(answerHistoryLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureLabel(text: String) {
        answerHistoryLabel.text = text
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        answerHistoryLabel.text = nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        answerHistoryLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView.snp.centerY)
            make.leading.equalTo(contentView.snp.leading).inset(16)
        }
    }

}
