//
//  AppDetailViewContorller.swift
//  AppStoreClone
//
//  Created by SunHo Lee on 2023/01/05.
//

import UIKit
import SnapKit
import Kingfisher
final class AppDetailViewController : UIViewController {
    private let today : Today
    private lazy var imageView : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 8.0
        return image
    }()
    private lazy var titleLabel : UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        return label
    }()
    private lazy var semiLabel : UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.textColor = .secondaryLabel
        return label
    }()
    private lazy var receiveBtn : UIButton = {
       let btn = UIButton()
        btn.setTitle("받기", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .bold)
        btn.layer.cornerRadius = 12.0
        btn.backgroundColor = .systemBlue
        btn.titleLabel?.textColor = .white
        return btn
    }()
    private lazy var shareBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        btn.tintColor = .systemBlue
        btn.addTarget(self, action: #selector(DidtapShareBtn), for: .touchUpInside)
        return btn
    }()
    @objc func DidtapShareBtn(){
        let activityItems: [Any ] = [today.title]
        let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        present(activityController, animated: true) 
    }
    init(today: Today){
        self.today = today
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupLayout()
        imageView.backgroundColor = .systemGray
        titleLabel.text = today.title
        semiLabel.text = today.description
        if let imageURL = URL(string: today.imageURL){
            imageView.kf.setImage(with: imageURL)
        }
        
    }
}
// MARK : Private
private extension AppDetailViewController {
    func setupLayout(){
        [imageView, titleLabel, semiLabel, receiveBtn, shareBtn].forEach{view.addSubview($0)}
        imageView.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16.0)
            $0.top.equalToSuperview().inset(32.0)
            $0.width.equalTo(100.0)
            $0.height.equalTo(imageView.snp.width)
        }
        titleLabel.snp.makeConstraints{
            $0.leading.equalTo(imageView.snp.trailing).offset(16.0)
            $0.top.equalTo(imageView.snp.top)
            $0.trailing.equalToSuperview().inset(16.0)
            
        }
        semiLabel.snp.makeConstraints{
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.top.equalTo(titleLabel.snp.bottom).offset(4.0)
            
        }
        receiveBtn.snp.makeConstraints{
            $0.leading.equalTo(imageView.snp.trailing).offset(16.0)
            $0.width.equalTo(60.0)
            $0.height.equalTo(32.0)
            $0.bottom.equalTo(imageView.snp.bottom)
        }
        shareBtn.snp.makeConstraints{
            $0.width.height.equalTo(32.0)
            $0.trailing.equalToSuperview().inset(16.0)
            $0.bottom.equalTo(receiveBtn.snp.bottom)
            
        }
    }
}
