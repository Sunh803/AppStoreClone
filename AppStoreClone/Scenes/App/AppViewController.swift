//
//  AppViewController.swift
//  AppStoreClone
//
//  Created by SunHo Lee on 2023/01/04.
//

import UIKit
import SnapKit
final class AppViewController : UIViewController {
    private let contentView = UIView()
    private let ScrollView = UIScrollView()
    private lazy var stackView : UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.distribution = .equalSpacing
        stackview.spacing = 0.0
        let featureSectionView = FeatureSectionView(frame: .zero)
        let rankingFeatureSectionView = RankingFeatureSectionView(frame: .zero)
        let exchangeCodeButtonView = ExchangecodeBtnView(frame: .zero )
        //공간이 없어 밑에 버튼이 잘리기에 임의의 공간을 추가해줌
        let spacingView = UIView()
        spacingView.snp.makeConstraints{
            $0.height.equalTo(100.0)
        }
        [featureSectionView,rankingFeatureSectionView,exchangeCodeButtonView, spacingView].forEach{
            stackview.addArrangedSubview($0)
        }
        return stackview
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupLayout()
    }
}
private extension AppViewController{
    func setupNavigationController(){
        navigationItem.title = "앱"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    func setupLayout(){
        view.addSubview(ScrollView)
        ScrollView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        ScrollView.addSubview(contentView)
        contentView.snp.makeConstraints{
            $0.edges.width.equalToSuperview()
        }
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
