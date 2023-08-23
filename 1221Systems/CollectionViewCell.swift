//
//  CollectionViewCell.swift
//  1221Systems
//
//  Created by Adilet on 23/8/23.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "cell"
    
    lazy var image: UIImageView = {
        let i = UIImageView()
        
        return i
    }()
    
    lazy var name: UILabel = {
        let l = UILabel()
        l.font = .boldSystemFont(ofSize: 17)
        l.textColor = .white
        l.textAlignment = .center
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = R.color.infoView()
        contentView.layer.cornerRadius = 16
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CollectionViewCell {
    func setupSubviews() {
        contentView.addSubview(image)
        contentView.addSubview(name)
    }
    func setupConstraints() {
        image.snp.makeConstraints{make in
            make.width.height.equalTo(140)
            make.top.equalToSuperview().inset(8)
            make.centerX.equalToSuperview()
        }
        name.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalTo(image.snp.bottom).offset(16)
            make.width.equalToSuperview()
        }
    }
}
