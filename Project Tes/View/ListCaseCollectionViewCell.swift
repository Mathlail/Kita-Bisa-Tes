//
//  ListCaseCollectionViewCell.swift
//  Project Tes
//
//  Created by Mathlail Fajri on 08/05/19.
//  Copyright © 2019 Mathlail Fajri. All rights reserved.
//

import UIKit

class ListCaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var bannerView: CardView = {
        let view = CardView()
        view.cornerRadius = 7
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    func setupView() {
        addSubview(bannerView)
        addSubview(titleLabel)
        
        bannerView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(30)
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-30)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.centerY.equalToSuperview()
        }
    }
}
