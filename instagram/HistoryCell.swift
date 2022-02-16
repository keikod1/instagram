//
//  HistoryCell.swift
//  instagram
//
//  Created by my macbook on 14/2/22.
//

import Foundation
import UIKit
import SnapKit

class HistoryCell: UICollectionViewCell {
    lazy var historyPhoto: UIImageView = {
        let view = UIImageView()
        view.image = .checkmark
        view.layer.cornerRadius = (frame.height + frame.width) / 6
        view.clipsToBounds = true
        return view
    }()
    lazy var historyName: UILabel = {
        let view = UILabel()
        view.text = "uerhfierj"
        view.textAlignment = .center
        view.textColor = .white
        view.font = .systemFont(ofSize: 14)
        return view
    }()
    
    override func layoutSubviews() {
        addSubview(historyPhoto)
        historyPhoto.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.5)
            make.height.equalTo(frame.width / 1.5)
        }
        addSubview(historyName)
        historyName.snp.makeConstraints { make in
            make.top.equalTo(historyPhoto.snp.bottom).offset(10)
            
           
        }
    }
    func fill(model: InstagramModel){
        historyPhoto.image = UIImage(named:  model.profilePhoto!)
        historyName.text = model.publicName
        
    }
}
