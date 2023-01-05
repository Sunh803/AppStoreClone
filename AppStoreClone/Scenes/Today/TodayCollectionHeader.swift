//
//  TodayCollectionHeader.swift
//  AppStoreClone
//
//  Created by SunHo Lee on 2023/01/03.
//

import Foundation
import UIKit
final class TodayCollectionHeader : UICollectionReusableView{
    private lazy var datelabel : UILabel = {
        let label = UILabel()
        label.text = "11월"
        label.font = .systemFont(ofSize: 14.0, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "today"
        label.font = .systemFont(ofSize: 36.0, weight: .black)
        label.textColor = .label
        return label
    }()
    func setupView(){
        [datelabel,titleLabel].forEach{addSubview($0)}
        datelabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(32)
        }
        titleLabel.snp.makeConstraints{
            $0.left.equalTo(datelabel)
            $0.top.equalTo(datelabel.snp.bottom).offset(8)
        }
    }
}
