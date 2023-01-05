//
//  ExchangecodeBtnView.swift
//  AppStoreClone
//
//  Created by SunHo Lee on 2023/01/05.
//

import UIKit
import SnapKit
final class ExchangecodeBtnView : UIView {
    private lazy var exchangebtn : UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 7.0
        btn.setTitle("코드 교환", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 15.0, weight:  .semibold)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.backgroundColor = .tertiarySystemGroupedBackground
        return btn
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(exchangebtn)
        exchangebtn.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16.0)
            $0.trailing.equalToSuperview().inset(16.0)
            $0.top.equalToSuperview().inset(32.0)
            $0.bottom.equalToSuperview().offset(32.0)
            $0.height.equalTo(40.0)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("errror")
    }
}
