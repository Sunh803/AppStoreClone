//
//  FeatureSectionCell.swift
//  AppStoreClone
//
//  Created by SunHo Lee on 2023/01/04.
//

import SnapKit
import UIKit
import Kingfisher
final class FeatureSectionCell : UICollectionViewCell{
    private lazy var smallTitle : UILabel = {
        let title = UILabel()
        title.textColor = .systemBlue
        title.font = .systemFont(ofSize: 12.0, weight: .semibold)
        return title
    }()
    private lazy var Mediumtitle : UILabel = {
        let title = UILabel()
        title.textColor = .label
        title.font = .systemFont(ofSize: 20.0, weight: .bold)
        return title
    }()
    private lazy var underTitle : UILabel = {
        let title = UILabel()
        title.textColor = .secondaryLabel
        title.font = .systemFont(ofSize: 16.0, weight: .semibold)
        return title
    }()
    private lazy var ImageView : UIImageView = {
       let image = UIImageView()
        image.layer.cornerRadius = 7.0
        image.layer.borderWidth = 0.5
        image.layer.borderColor = UIColor.separator.cgColor
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    func setup(feature : Feature){
        setupLayout()
        smallTitle.text = feature.type
        Mediumtitle.text = feature.appName
        underTitle.text =   feature.description
        if let imageUrl = URL(string: feature.imageURL){
            ImageView.kf.setImage(with: imageUrl)
        }
        
    }
}
private extension FeatureSectionCell {
    func setupLayout(){
        [smallTitle, Mediumtitle, underTitle, ImageView].forEach{
            addSubview($0)
        }
        smallTitle.snp.makeConstraints{
            $0.leading.trailing.top.equalToSuperview()
        }
        Mediumtitle.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(smallTitle.snp.bottom)
        }
        underTitle.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(Mediumtitle.snp.bottom).offset(4.0)
        }
        ImageView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(underTitle.snp.bottom).offset(8.0)
            $0.bottom.equalToSuperview().inset(8.0)
        }
    }
}
