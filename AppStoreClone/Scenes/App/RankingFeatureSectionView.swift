//
//  RankingFeatureSectionView.swift
//  AppStoreClone
//
//  Created by SunHo Lee on 2023/01/05.
//

import UIKit
import SnapKit
final class RankingFeatureSectionView : UIView {
    private var rankingLists : [RankingFeature] = []
    private lazy var titleLabel : UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 18.0, weight: .black)
        label.text = "IPhone이 처음이라면"
        return label
    }()
    private lazy var showAllAppBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("모두 보기", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14.0, weight: .semibold)
        return btn
    }()
    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 32.0
        layout.minimumInteritemSpacing = 0.0
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0, right: 16.0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(RankingCell.self, forCellWithReuseIdentifier: "RankingCell")
        return collectionView
    }()
    private let separator = SeparatorView(frame: .zero)
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        fetchData()
        collectionView.reloadData()
    }
    required init?(coder: NSCoder) {
        fatalError("error")
    }
}
extension RankingFeatureSectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width-32, height: RankingCell.height)
    }
}
extension RankingFeatureSectionView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rankingLists.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RankingCell", for: indexPath) as? RankingCell
        cell?.setup(ranking: rankingLists[indexPath.row])
      
        return cell ?? UICollectionViewCell()
    }
}
private extension RankingFeatureSectionView{
    func setupView(){
        [titleLabel, showAllAppBtn, collectionView,separator].forEach{
            addSubview($0)
        }
        titleLabel.snp.makeConstraints{
            $0.leading.top.equalToSuperview().inset(16.0)
            $0.trailing.equalTo(showAllAppBtn.snp.leading).offset(8.0)
        }
        showAllAppBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(16.0)
            $0.bottom.equalTo(titleLabel.snp.bottom)
        }
        collectionView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(16.0)
            $0.height.equalTo(RankingCell.height*3)
            $0.leading.trailing.equalToSuperview()
        }
        separator.snp.makeConstraints{
            $0.top.equalTo(collectionView.snp.bottom).offset(16.0)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
    func fetchData(){
        guard let url = Bundle.main.url(forResource: "RankingFeature", withExtension: "plist") else{return}
        do{
            let data = try Data(contentsOf: url)
            let result = try PropertyListDecoder().decode([RankingFeature].self, from: data)
            rankingLists = result
        }catch{}
    }
}
