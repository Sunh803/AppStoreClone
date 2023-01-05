//
//  SeparatorView.swift
//  AppStoreClone
//
//  Created by SunHo Lee on 2023/01/05.
//

import UIKit
import SnapKit
final class SeparatorView : UIView {
    private lazy var separator : UIView = {
       let sepa = UIView()
        sepa.backgroundColor = .separator
        return sepa
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(separator)
        separator.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16.0)
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(0.5)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("error has been implemented")
    }
}
