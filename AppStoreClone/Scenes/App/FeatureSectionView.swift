//
//  FeatureSectionView.swift
//  AppStoreClone
//
//  Created by SunHo Lee on 2023/01/04.
//

import UIKit
import SnapKit
final class FeatureSectionView : UIView{
    private var featureList : [Feature] = []
    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true //가로로 스크롤뷰했을때  width에 딱딱 맞게됨
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(FeatureSectionCell.self, forCellWithReuseIdentifier: "FeatureCell")
        return collectionView
    }()
    private let separator = SeparatorView(frame: .zero)
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        fetchData()
        collectionView.reloadData() //data를가져온후 다시 리로드 해야함!!콜렉션뷰
    }
    required init?(coder: NSCoder) {
        fatalError("Error has been implemented")
    }
}
extension FeatureSectionView : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width-32, height: frame.width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        32.0
    }
}
extension FeatureSectionView : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return featureList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeatureCell", for: indexPath) as? FeatureSectionCell
        let feature = featureList[indexPath.row]
        cell?.setup(feature: feature)
        return cell ?? UICollectionViewCell()
    }
}
private extension FeatureSectionView {
    func setupViews(){
        [collectionView, separator].forEach{addSubview($0)}
        collectionView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(16)
            $0.height.equalTo(snp.width)
            $0.bottom.equalToSuperview()
        }
        separator.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(collectionView.snp.bottom).offset(16.0)
            $0.bottom.equalToSuperview()
        }
    }
    func fetchData(){
        guard let url = Bundle.main.url(forResource: "Feature", withExtension: "plist") else {return}
        do{
            let data = try Data(contentsOf: url)
            let result = try PropertyListDecoder().decode([Feature].self, from: data)
            featureList = result
        }
        catch{}
    }
}
