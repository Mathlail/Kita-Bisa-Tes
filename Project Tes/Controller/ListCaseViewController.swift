//
//  ListCaseViewController.swift
//  Project Tes
//
//  Created by Mathlail Fajri on 08/05/19.
//  Copyright © 2019 Mathlail Fajri. All rights reserved.
//

import UIKit
import Hero
import ChameleonFramework

enum Case: String {
    case Sum
    case Multiply
    case First_Prime
    case Fibonacci
}

class ListCaseViewController: UIViewController, UICollectionViewDataSource {
    
    let baseCollectionView = BaseCollectionView()
    
    override func loadView() {
        view = baseCollectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupCollectionView()
    }
    
    func setupNavBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.view.backgroundColor = UIColor.flatMagenta()
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        title = "Choose Case"
    }
    
    func setupCollectionView() {
        baseCollectionView.collectionView.delegate = self
        baseCollectionView.collectionView.dataSource = self
        baseCollectionView.collectionView.register(ListCaseCollectionViewCell.self, forCellWithReuseIdentifier: "LIstCaseCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LIstCaseCell", for: indexPath) as! ListCaseCollectionViewCell
        switch indexPath.row {
        case 0:
            cell.bannerView.backgroundColor = UIColor.flatGreen()
            cell.titleLabel.text = Case.Sum.rawValue
        case 1:
            cell.bannerView.backgroundColor = UIColor.flatPink()
            cell.titleLabel.text = Case.Multiply.rawValue
        case 2:
            cell.bannerView.backgroundColor = UIColor.flatPurple()
            cell.titleLabel.text = Case.First_Prime.rawValue.replacingOccurrences(of: "_", with: " ")
        case 3:
            cell.bannerView.backgroundColor = UIColor.flatYellow()
            cell.titleLabel.text = Case.Fibonacci.rawValue
        default:
            break
        }
        return cell
    }

}

extension ListCaseViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ListCaseCollectionViewCell
        let heroId = "cell\(indexPath.item)"
        cell.bannerView.hero.id = heroId
        let vc = DetailViewController()
        vc.hero.isEnabled = true
        vc.contentView.backgroundColor = .white
        vc.contentView.BGView.backgroundColor = cell.bannerView.backgroundColor
        vc.contentView.BGView.hero.id = heroId
        switch indexPath.row {
        case 0:
            vc.contentView.titleLabel.text = Case.Sum.rawValue
            vc.caseType = .Sum
        case 1:
            vc.contentView.titleLabel.text = Case.Multiply.rawValue
            vc.caseType = .Multiply
        case 2:
            vc.contentView.titleLabel.text = Case.First_Prime.rawValue.replacingOccurrences(of: "_", with: " ")
            vc.caseType = .First_Prime
        case 3:
            vc.contentView.titleLabel.text = Case.Fibonacci.rawValue
            vc.caseType = .Fibonacci
        default:
            break
        }
        present(vc, animated: true, completion: nil)
    }
}

extension ListCaseViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds
        return CGSize(width: screenSize.width, height: (baseCollectionView.collectionView.frame.height / 4))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

