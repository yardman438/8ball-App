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
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(asset: Asset.textColor)
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(answerHistoryLabel)
        contentView.addSubview(dateLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureLabel(text: String, date: String) {
        answerHistoryLabel.text = text
        dateLabel.text = date
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        answerHistoryLabel.text = nil
        dateLabel.text = nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        answerHistoryLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(contentView)
            make.leading.equalTo(contentView).inset(16)
            make.width.lessThanOrEqualTo(272)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(contentView)
            make.trailing.equalTo(contentView).inset(16)
        }
    }
}
