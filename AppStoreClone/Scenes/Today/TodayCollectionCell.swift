//
//  TodayCollectionCell.swift
//  AppStoreClone
//
//  Created by SunHo Lee on 2023/01/03.
//

import Foundation
import UIKit
import Kingfisher
final class TodayCollectionCell : UICollectionViewCell {
    func setup(today: Today){
        setupSubview()
        layer.shadowColor = UIColor.systemPink.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 10
        subTitle.text = today.subTitle
        MainTitle.text = today.title
        underTitle.text = today.description
        if let imageURL = URL(string: today.imageURL){
            imageView.kf.setImage(with: imageURL)
        }
        
    }
    private lazy var subTitle : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .white
        return label
    }()
    private lazy var MainTitle : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        label.textColor = .white
        return label
    }()
    private lazy var underTitle : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .white
        return label
    }()
    private lazy var imageView : UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true //이미지뷰의 크기보다 이미지가 크면 벗어나서 표시되기 때문에 true로 해주어야함.
        imageview.layer.cornerRadius = 12.0
        imageview.backgroundColor = .gray
        return imageview
    }()
}
private extension TodayCollectionCell {
    func setupSubview(){
        [imageView,MainTitle,underTitle,subTitle].forEach{addSubview($0)}
        subTitle.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24)
            $0.trailing.equalToSuperview().inset(24)
            $0.top.equalToSuperview().inset(24)
        }
        MainTitle.snp.makeConstraints{
            $0.leading.trailing.equalTo(subTitle)
            $0.top.equalTo(subTitle.snp.bottom).offset(4)
    
        }
        underTitle.snp.makeConstraints{
            $0.bottom.leading.trailing.equalToSuperview().inset(24)
            
        }
        imageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }

}
