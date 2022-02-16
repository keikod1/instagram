//
//  HistoryCollectionView.swift
//  instagram
//
//  Created by my macbook on 15/2/22.
//

import Foundation
import UIKit
import SnapKit

class HistoryCollectionView: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    var historyArray: [InstagramModel] = [InstagramModel(profilePhoto: "bill", publicName: "bill_Geits"),
                                           InstagramModel(profilePhoto: "leyla", publicName: "banshee"),
                                           InstagramModel(profilePhoto: "mia", publicName: "monika"),
                                           InstagramModel(profilePhoto: "mark", publicName: "mark.0594"),
                                           InstagramModel(profilePhoto: "stroun", publicName: "stroustrup"),
                                           InstagramModel(publicPhoto: "torvald", profilePhoto: "torvald", publicName: "torvalds_linus"),
                                           InstagramModel(profilePhoto: "mark", publicName: "mark.0594"),
                                           InstagramModel(profilePhoto: "stroun", publicName: "stroustrup"),
                                           InstagramModel(publicPhoto: "torvald", profilePhoto: "torvald", publicName: "torvalds_linus"),
                                           
      ]
    
    static let identifier = "HistoryCollectionView"
    
    let storyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .black
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        setupSubViews()
        setupCollectionView()
    }
    func setupSubViews(){
           addSubview(storyCollectionView)
           storyCollectionView.snp.makeConstraints { make in
               make.edges.equalToSuperview()
           }
       }
       
       private func setupCollectionView(){
           storyCollectionView.register(HistoryCell.self, forCellWithReuseIdentifier: "HistoryCell")
       }
       
           func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
               return historyArray.count
           }
           
           func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HistoryCell", for: indexPath) as! HistoryCell
               let model = historyArray[indexPath.row]
               cell.fill(model: model)
               return cell
           }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: frame.height - 10, height: frame.height - 10)
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
