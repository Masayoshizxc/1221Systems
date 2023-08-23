//
//  DetailedView.swift
//  1221Systems
//
//  Created by Adilet on 23/8/23.
//

import UIKit
import SnapKit

class DetailedView: BaseViewController {
    
    var coordinator: MainCoordinator?
    
    lazy var image: UIImageView = {
        let i = UIImageView()
        i.layer.cornerRadius = 16
        return i
    }()
    
    lazy var name: UILabel = {
        let l = UILabel()
        l.font = .boldSystemFont(ofSize: 22)
        l.textColor = .white
        return l
    }()
    
    lazy var status: UILabel = {
        let l = UILabel()
        l.textColor = R.color.status()
        l.font = .systemFont(ofSize: 16)
        return l
    }()
    
    lazy var infoLabel: UILabel = {
        let l = UILabel()
        l.font = .boldSystemFont(ofSize: 17)
        l.textColor = .white
        l.text = "Info"
        return l
    }()
    
    lazy var infoView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 16
        v.backgroundColor = R.color.infoView()
        return v
    }()
    
    lazy var speciesLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 16)
        l.textColor = R.color.label()
        l.text = "Species:"
        return l
    }()
    
    lazy var typeLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 16)
        l.textColor = R.color.label()
        l.text = "Type:"
        return l
    }()
    
    lazy var genderLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 16)
        l.textColor = R.color.label()
        l.text = "Gender:"
        return l
    }()
    
    lazy var species: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.font = .systemFont(ofSize: 16)
        return l
    }()
    
    lazy var type: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.font = .systemFont(ofSize: 16)
        l.text = "none"
        return l
    }()
    
    lazy var gender: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.font = .systemFont(ofSize: 16)
        return l
    }()
    
    lazy var originLabel: UILabel = {
        let l = UILabel()
        l.font = .boldSystemFont(ofSize: 17)
        l.textColor = .white
        l.text = "Origin"
        return l
    }()
    
    lazy var originView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 16
        v.backgroundColor = R.color.infoView()
        return v
    }()
    
    lazy var originName: UILabel = {
        let l = UILabel()
        l.font = .boldSystemFont(ofSize: 17)
        l.textColor = .white
        return l
    }()
    
    lazy var originType: UILabel = {
        let l = UILabel()
        l.textColor = R.color.status()
        l.font = .systemFont(ofSize: 13)
        return l
    }()
    
    lazy var originImage: UIImageView = {
        let i = UIImageView()
        i.layer.cornerRadius = 10
        i.backgroundColor = R.color.space()
        return i
    }()
    
    lazy var episodesLabel: UILabel = {
        let l = UILabel()
        l.font = .boldSystemFont(ofSize: 17)
        l.textColor = .white
        l.text = "Episodes"
        return l
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = R.color.space()
        setupSubviews()
        setupConstraints()
    }
    
}

extension DetailedView {
    func setupSubviews() {
        view.addSubview(image)
        view.addSubview(name)
        view.addSubview(status)
        view.addSubview(infoLabel)
        view.addSubview(infoView)
        infoView.addSubview(speciesLabel)
        infoView.addSubview(typeLabel)
        infoView.addSubview(genderLabel)
        infoView.addSubview(species)
        infoView.addSubview(type)
        infoView.addSubview(gender)
        view.addSubview(originLabel)
        view.addSubview(originView)
        originView.addSubview(originName)
        originView.addSubview(originType)
        originView.addSubview(originImage)
        view.addSubview(episodesLabel)
//        view.addSubview(<#T##view: UIView##UIView#>)
//        view.addSubview(<#T##view: UIView##UIView#>)
    }
    func setupConstraints() {
        
        
        image.snp.makeConstraints{ make in
            make.width.height.equalTo(148)
            make.top.equalToSuperview().inset(108)
            make.centerX.equalToSuperview()
        }
        name.snp.makeConstraints{ make in
            make.top.equalTo(image.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
        status.snp.makeConstraints{ make in
            make.top.equalTo(name.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        infoLabel.snp.makeConstraints{ make in
            make.top.equalTo(status.snp.bottom).offset(24)
            make.left.equalToSuperview().inset(24)
        }
        infoView.snp.makeConstraints{ make in
            make.top.equalTo(infoLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(124)
        }
        speciesLabel.snp.makeConstraints{ make in
            make.top.left.equalToSuperview().inset(16)
        }
        typeLabel.snp.makeConstraints{ make in
            make.top.equalTo(speciesLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().inset(16)
        }
        genderLabel.snp.makeConstraints{ make in
            make.top.equalTo(typeLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().inset(16)
        }
        species.snp.makeConstraints{ make in
            make.top.right.equalToSuperview().inset(16)
        }
        type.snp.makeConstraints{ make in
            make.top.equalTo(species.snp.bottom).offset(16)
            make.right.equalToSuperview().inset(16)
        }
        gender.snp.makeConstraints{ make in
            make.top.equalTo(type.snp.bottom).offset(16)
            make.right.equalToSuperview().inset(16)
        }
        originLabel.snp.makeConstraints{ make in
            make.top.equalTo(infoView.snp.bottom).offset(24)
            make.left.equalToSuperview().inset(24)
        }
        originView.snp.makeConstraints{ make in
            make.top.equalTo(originLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(80)
        }
        originName.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(16)
            make.left.equalTo(originImage.snp.right).offset(16)
        }
        originType.snp.makeConstraints{ make in
            make.top.equalTo(originName.snp.bottom).offset(8)
            make.left.equalTo(originImage.snp.right).offset(16)
        }
        originImage.snp.makeConstraints{ make in
            make.width.height.equalTo(64)
            make.top.left.equalToSuperview().inset(8)
        }
        episodesLabel.snp.makeConstraints{ make in
            make.top.equalTo(originView.snp.bottom).offset(24)
            make.left.equalToSuperview().inset(24)
        }
        
    }
}


