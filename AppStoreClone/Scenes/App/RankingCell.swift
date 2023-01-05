//
//  RankingCell.swift
//  AppStoreClone
//
//  Created by SunHo Lee on 2023/01/05.
//
import Kingfisher
import UIKit
import SnapKit
final class RankingCell : UICollectionViewCell{
    static var height : CGFloat {70.0}
    private lazy var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .tertiarySystemGroupedBackground
        return imageView
    }()
    private lazy var TitleLabel : UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16.0,weight: .bold)
        label.textColor = .label
        label.numberOfLines = 2
        return label
    }()
    private lazy var descrptionLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    private lazy var downloadBtn : UIButton = {
       let btn = UIButton()
        btn.setTitle("받기", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 13.0,weight: .bold)
        btn.backgroundColor = .secondarySystemBackground
        btn.layer.cornerRadius = 12.0
        return btn
    }()
    private var isAppPurchaseInfoLabel : UILabel = {
        let label = UILabel()
        label.text = "앱 내 구입"
        label.font  = .systemFont(ofSize: 10.0, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    func setup(ranking : RankingFeature){
        setupLayout()
        TitleLabel.text = ranking.title
        descrptionLabel.text = ranking.description
        isAppPurchaseInfoLabel.isHidden = ranking.isInPurchaseApp

    }
    
}
private extension RankingCell{
    func setupLayout(){
        [imageView, TitleLabel, descrptionLabel, downloadBtn, isAppPurchaseInfoLabel].forEach{addSubview($0)}
        imageView.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(4.0)
            $0.width.equalTo(imageView.snp.height)
        }
        downloadBtn.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(24.0)
            $0.width.equalTo(50.0)
        }
        isAppPurchaseInfoLabel.snp.makeConstraints{
            $0.centerX.equalTo(downloadBtn.snp.centerX)
            $0.top.equalTo(downloadBtn.snp.bottom).offset(4.0)
        }
        TitleLabel.snp.makeConstraints{
            $0.leading.equalTo(imageView.snp.trailing).offset(8.0)
            $0.trailing.equalTo(downloadBtn.snp.leading)
            $0.top.equalTo(imageView.snp.top).inset(8.0)
        }
        descrptionLabel.snp.makeConstraints{
            $0.leading.equalTo(TitleLabel.snp.leading)
            $0.trailing.equalTo(TitleLabel.snp.trailing)
            $0.top.equalTo(TitleLabel.snp.bottom).offset(4.0)
            
        }
    }
    
}
