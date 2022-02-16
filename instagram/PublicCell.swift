//
//  PublicCell.swift
//  instagram
//
//  Created by my macbook on 14/2/22.
//

import Foundation
import UIKit
import SnapKit

class PublicCell: UICollectionViewCell {
   private lazy var publicPhoto: UIImageView = {
        let view = UIImageView()
        view.image = .actions
        return view
    }()
    private lazy var profilePhoto: UIImageView = {
        let view = UIImageView()
        view.image = .checkmark
        view.layer.cornerRadius =  (frame.height + frame.width) / 48
        view.clipsToBounds = true
        return view
    }()
    private lazy var publicName: UILabel = {
        let view = UILabel()
        view.text = "uerhfierj"
        view.textColor = .white
        return view
    }()
   private lazy var action: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName:  "ellipsis"), for: .normal)
        view.tintColor = .white
        return view
    }()
    private lazy var touchPublicCell: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.backgroundColor = .black
        view.distribution = .fillProportionally
        return view
    }()
    private lazy var likeButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .black
        view.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        view.tintColor = .white
        view.addTarget(self, action: #selector(clickLike(view:)), for: .touchUpInside)
        return view
    }()
    private lazy var messageButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .black
        view.setImage(UIImage(systemName: "message"), for: .normal)
        view.tintColor = .white
        return view
    }()
    private lazy var shareButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .black
        view.setImage(UIImage(systemName: "paperplane"), for: .normal)
        view.tintColor = .white
        return view
    }()
    private lazy var saveButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .black
        view.setImage(UIImage(systemName: "bookmark"), for: .normal)
        view.tintColor = .white
        view.addTarget(self, action: #selector(clicsave(view:)), for: .touchUpInside)
        return view
    }()
    
    private lazy var likesLabel: UILabel = {
        let view = UILabel()
        view.text = " нравится"
        view.font = .systemFont(ofSize: 10)
        view.textColor = .white
        return view
    }()
    
    
    @objc func clickLike(view: UIButton){
        var value = 0
        value = value + 1
      likesLabel.text = String("\(value) нравится")
        likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        likeButton.tintColor = .red
        
    }
    @objc func clicsave(view: UIButton){
        saveButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
    }
    
    
    override func layoutSubviews() {
        addSubview(profilePhoto)
        profilePhoto.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(frame.height / 12)
            make.width.equalTo(frame.height / 12)
        }
        addSubview(publicName) 
        publicName.snp.makeConstraints { make in
            make.centerY.equalTo(profilePhoto)
            make.left.equalTo(profilePhoto.snp.right).offset(10)
        }
        addSubview(action)
        action.snp.makeConstraints { make in
            make.centerY.equalTo(profilePhoto)
            make.right.equalToSuperview()
            make.height.equalTo(frame.height / 12)
            make.width.equalTo(frame.height / 12)
        }
    
        addSubview(publicPhoto)
        publicPhoto.snp.makeConstraints { make in
            make.top.equalTo(profilePhoto.snp.bottom).offset(10)
            make.height.equalTo(frame.height / 1.5)
            make.width.equalToSuperview()
        }
        
        addSubview(touchPublicCell)
        touchPublicCell.snp.makeConstraints { make in
            make.top.equalTo(publicPhoto.snp.bottom)
            make.left.equalToSuperview().offset(10)
            make.height.equalTo(frame.height / 10)
            make.width.equalTo(frame.width / 3.5 )
            make.bottom.equalToSuperview().offset(-10)
        }
        
        touchPublicCell.addArrangedSubview(likeButton)
        touchPublicCell.addArrangedSubview(messageButton)
        touchPublicCell.addArrangedSubview(shareButton)
        
        addSubview(likesLabel)
        likesLabel.snp.makeConstraints { make in
            make.height.equalTo(frame.height / 20)
            make.width.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.bottom.equalToSuperview()
        }
        addSubview(saveButton)
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(publicPhoto.snp.bottom)
            make.right.equalToSuperview()
            make.height.equalTo(frame.height / 10)
            make.width.equalTo(frame.width / 10)
            
            
        }
    }
    func fill(model: InstagramModel){
        publicPhoto.image = UIImage(named: model.publicPhoto!)
        profilePhoto.image = UIImage(named:  model.profilePhoto!)
        publicName.text = model.publicName
    }
}
