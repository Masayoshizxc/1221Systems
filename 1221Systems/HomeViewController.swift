//
//  ViewController.swift
//  1221Systems
//
//  Created by Adilet on 23/8/23.
//

import UIKit
import SnapKit

class HomeViewController: BaseViewController {
    
    var coordinator: MainCoordinator?
    
    var characters: Character?
    
    lazy var headerTitle: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.font = .boldSystemFont(ofSize: 28)
        l.text = "Characters"
        
        return l
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = R.color.space()
        cv.showsVerticalScrollIndicator = false
        
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = R.color.space()
        setupSubviews()
        setupConstraints()
        getRequest()
    }


}

extension HomeViewController {
    func setupSubviews() {
        view.addSubview(headerTitle)
        view.addSubview(collectionView)
    }
    func setupConstraints() {
        headerTitle.snp.makeConstraints{make in
            make.left.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(76.5)
        }
        collectionView.snp.makeConstraints{make in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(113)
            make.bottom.equalToSuperview()
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        getData(from: URL(string: (characters?.results?[indexPath.row].image) ?? "none")!) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                cell.image.image = UIImage(data: data)
            }
        }
        cell.name.text = characters?.results?[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width - 56) / 2, height: 202)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 31, left: 0, bottom: -31, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var image: UIImage?
        getData(from: URL(string: (characters?.results?[indexPath.row].image) ?? "none")!) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                image = UIImage(data: data)
            }
        }
        var originType: String?
//        guard let url = URL(string: (characters?.results?[indexPath.row].origin?.url)! else { return }
//        getData(from: URL(string: (characters?.results?[indexPath.row].origin?.url) ?? "none")!) { data, response, error in
//            guard let data = data, error == nil else { return }
//            DispatchQueue.main.async { [weak self] in
//                originType = String(decoding: data, as: UTF8.self)
//            }
//        }
        coordinator?.details(image: image, status: characters?.results?[indexPath.row].status ?? "none", spesies: characters?.results?[indexPath.row].species ?? "none", type: characters?.results?[indexPath.row].type ?? "none", gender: characters?.results?[indexPath.row].gender ?? "none", originName: characters?.results?[indexPath.row].origin?.name ?? "none", originType: originType ?? "none")
    }

}

extension HomeViewController {
    
    func getRequest() {
        if let url = URL(string: "https://rickandmortyapi.com/api/character") {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }
                if let httpResponse = response as? HTTPURLResponse {
                    print("Status code: \(httpResponse.statusCode)")
                }
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        self.characters = try decoder.decode(Character.self, from: data)
//                        print(character.results)
                        let json = try JSONSerialization.jsonObject(with: data)
                        print(json)
                    }
                    catch {
                        
                    }
                }
            }.resume()
        }
    }
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
}
