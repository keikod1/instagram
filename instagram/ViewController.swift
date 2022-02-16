//
//  ViewController.swift
//  instagram
//
//  Created by my macbook on 14/2/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var instaText: UIImageView = {
        let view = UIImageView()
        view.image = .init(named: "photo_2022-02-16 16.18.03")
        return view
    
    }()
    private lazy var direct: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named:  "dm-icon-isolated-on-black-260nw-1851071749"), for: .normal)
        return view
    }()
    private lazy var collectionHistory: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: flow)
        view.delegate = self
        view.dataSource = self
        view.register(HistoryCollectionView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HistoryCollectionView")
        view.register(PublicCell.self, forCellWithReuseIdentifier: "PublicCell")
        view.backgroundColor = .black
        view.isSpringLoaded = true
        return view
    }()
    private lazy var touchBarInsta: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.backgroundColor = .black
        view.distribution = .fillEqually
        return view
    }()
    private lazy var HomeButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .black
        view.setImage(UIImage(systemName: "house.fill"), for: .normal)
        view.tintColor = .white
        return view
    }()
    private lazy var searchButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .black
        view.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        view.tintColor = .white
        return view
    }()
    private lazy var plusButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .black
        view.setImage(UIImage(systemName: "plus.app"), for: .normal)
        view.tintColor = .white
        return view
    }()
    private lazy var likeButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .black
        view.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        view.tintColor = .white
        return view
    }()
    private lazy var profileButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .black
        view.setImage(UIImage(systemName: "person", compatibleWith: .none), for: .normal)
        view.tintColor = .white
       
        return view
    }()
    
    
    private lazy var publicArray: [InstagramModel] = [InstagramModel(publicPhoto: "bill", profilePhoto: "bill", publicName: "bill_Geits"),
                                         InstagramModel(publicPhoto: "leyla", profilePhoto: "leyla", publicName: "banshee"),
                                         InstagramModel(publicPhoto: "mia", profilePhoto: "mia", publicName: "monika"),
                                         InstagramModel(publicPhoto: "mark", profilePhoto: "mark", publicName: "mark.0594"),
                                         InstagramModel(publicPhoto: "stroun", profilePhoto: "stroun", publicName: "stroustrup"),
                                         InstagramModel(publicPhoto: "kosmetic", profilePhoto: "kosmetic", publicName: "lux_cosmetics"),
                                         InstagramModel(publicPhoto: "torvald", profilePhoto: "torvald", publicName: "torvald_linus"),
                                         InstagramModel(publicPhoto: "monika", profilePhoto: "monika", publicName: "with_0490"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        view.addSubview(instaText)
        instaText.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview()
            make.height.equalTo(view.frame.height / 10)
            make.width.equalTo(view.frame.width / 2)
        }
        view.addSubview(direct)
        direct.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(view.frame.height / 16)
            make.width.equalTo(view.frame.height / 16)
        }
        view.addSubview(collectionHistory)
        collectionHistory.snp.makeConstraints { make in
            make.top.equalTo(instaText.snp.bottom)
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
        view.addSubview(touchBarInsta)
        touchBarInsta.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(view.frame.height / 10)
            make.width.equalToSuperview()
        }
        touchBarInsta.addArrangedSubview(HomeButton)
        touchBarInsta.addArrangedSubview(searchButton)
        touchBarInsta.addArrangedSubview(plusButton)
        touchBarInsta.addArrangedSubview(likeButton)
        touchBarInsta.addArrangedSubview(profileButton)
        
        // Do any additional setup after loading the view.
    }


}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return publicArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PublicCell", for: indexPath) as!  PublicCell
        let model = publicArray[index]
        cell.fill(model: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let index = indexPath.row
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HistoryCollectionView", for: indexPath) as! HistoryCollectionView
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width: view.frame.width, height: view.frame.width / 4)
        }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
    }
    
    
    


