//
//  DetailViewController.swift
//  Project Tes
//
//  Created by Mathlail Fajri on 08/05/19.
//  Copyright © 2019 Mathlail Fajri. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let contentView: DetailView = {
        let view = DetailView()
        view.calculateButton.addTarget(self, action: #selector(didTapCalculate), for: .touchUpInside)
        return view
    }()
    
    var caseType: Case?
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if caseType == .Fibonacci || caseType == .First_Prime {
            contentView.changeConstraint()
            contentView.yTextField.borderInactiveColor = .clear
            contentView.yTextField.placeholder = caseType == .Fibonacci ? "Maximal Input X Value is 92" : "Maximal Input X Value is 1000"
            contentView.yTextField.isEnabled = false
        }
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(back)))
    }
    
    func basicOperation(x: Int, y: Int) -> Int {
        if caseType == .Sum {
            return x + y
        }
        return x * y
    }
    
    func getFirstPrime(x: Int) -> [Int] {
        var primeArray = [Int]()
        for num in 0..<x*2 {
            if num % 2 != 0 {
                primeArray.append(num)
            }
        }
        return primeArray
    }
    
    func fibonacciNumber(x: Int) -> [Int] {
        var sequence = [0, 1]
        if x < 3 {
            return sequence
        }
        
        for _ in 0...x - 3 {
            let firstNumber = sequence[sequence.count - 2]
            let secondNumber = sequence.last!
            sequence.append(firstNumber + secondNumber)
        }
        return sequence
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapCalculate() {
        guard let xValue = contentView.xTextField.text, let yValue = contentView.yTextField.text else {return}
        switch caseType {
        case .Sum?, .Multiply?:
            contentView.valueLabel.text = "\(basicOperation(x: Int(xValue) ?? 0, y: Int(yValue) ?? 0))"
        case .First_Prime?:
            if Int(xValue) ?? 0 <= 1000 {
                contentView.valueLabel.text = "\(getFirstPrime(x: Int(xValue) ?? 0))"
            }
        case .Fibonacci?:
            if Int(xValue) ?? 0 <= 92 {
                contentView.valueLabel.text = "\(fibonacciNumber(x: Int(xValue) ?? 0))"
            }
        default:
            break
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            contentView.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: contentView.frame.size.height - keyboardSize.height, right: 0)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            contentView.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
}
