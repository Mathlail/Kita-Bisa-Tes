//
//  DetailView.swift
//  Project Tes
//
//  Created by Mathlail Fajri on 09/05/19.
//  Copyright © 2019 Mathlail Fajri. All rights reserved.
//

import UIKit
import TextFieldEffects

class DetailView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var scrollView: UIScrollView = { [unowned self] in
        let view = UIScrollView()
        view.addSubview(innerView)
        return view
    }()
    
    lazy var innerView: UIView = { [unowned self] in
        let view = UIView()
        view.addSubview(BGView)
        return view
    }()
    
    lazy var BGView: CardView = {
        let view = CardView()
        view.cornerRadius = 7
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Multiply"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    lazy var xTextField: HoshiTextField = {
        let textField = HoshiTextField()
        textField.placeholder = "Input X"
        textField.placeholderColor = .white
        textField.borderActiveColor = .white
        textField.borderInactiveColor = .darkGray
        textField.textAlignment = .center
        textField.textColor = .white
        textField.keyboardType = .numberPad
        return textField
    }()
    
    lazy var yTextField: HoshiTextField = {
        let textField = HoshiTextField()
        textField.placeholder = "Input Y"
        textField.placeholderColor = .white
        textField.borderActiveColor = .white
        textField.borderInactiveColor = .darkGray
        textField.textAlignment = .center
        textField.textColor = .white
        textField.keyboardType = .numberPad
        return textField
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Calculate", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 7
        return button
    }()
    
    lazy var answerLabel: UILabel = {
        let label = UILabel()
        label.text = "Answer"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.text = "_"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    func setupView() {
        addSubview(scrollView)
        BGView.addSubview(xTextField)
        BGView.addSubview(titleLabel)
        BGView.addSubview(yTextField)
        BGView.addSubview(calculateButton)
        BGView.addSubview(answerLabel)
        BGView.addSubview(valueLabel)
        
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        innerView.snp.makeConstraints { (make) in
            make.edges.equalTo(scrollView)
            make.width.equalTo(self)
        }
        
        BGView.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
            make.centerY.equalTo(scrollView)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        xTextField.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.top.equalTo(titleLabel.snp.bottom).offset(35)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        
        yTextField.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.top.equalTo(xTextField.snp.bottom).offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        
        calculateButton.snp.makeConstraints { (make) in
            make.height.equalTo(35)
            make.top.equalTo(yTextField.snp.bottom).offset(45)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        
        answerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(calculateButton.snp.bottom).offset(35)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
        }
        
        valueLabel.snp.makeConstraints { (make) in
            make.top.equalTo(answerLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
            make.bottom.equalToSuperview().offset(-25)
        }
    }
    
    func changeConstraint() {
        BGView.snp.remakeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
            make.topMargin.equalToSuperview().offset(50)
        }
    }
    
}
