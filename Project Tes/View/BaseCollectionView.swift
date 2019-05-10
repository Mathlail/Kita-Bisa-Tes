//
//  BaseCollectionView.swift
//  Project Tes
//
//  Created by Mathlail Fajri on 08/05/19.
//  Copyright © 2019 Mathlail Fajri. All rights reserved.
//

import UIKit
import SnapKit

class BaseCollectionView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    func setupView() {
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }

}
