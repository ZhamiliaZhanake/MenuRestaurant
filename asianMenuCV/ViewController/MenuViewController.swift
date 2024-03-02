//
//  ViewController.swift
//  asianMenuCV
//
//  Created by Zhamilia Zhanakeeva on 1/3/24.
//

import UIKit

class MenuViewController: UIViewController {
    let menuLabel = MakerView().makerLabel(text: "Menu", size: 24)
    private let searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .black
        return button
    }()
    let dishes = [ Dish(title: "Roll", image: UIImage(named: "roll")),
                   Dish(title: "Chicken", image: UIImage(named: "chicken")),
                   Dish(title: "Desert", image: UIImage(named: "blinnyiTort")),
                   Dish(title: "Pizza", image: UIImage(named: "pizza"))]
    private let collectionView1: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 150)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        cv.layer.cornerRadius = 15
        return cv
    }()
    let sortByLabel = MakerView().makerLabel(text: "Sort by", size: 24)
    let mostPopularLabel = MakerView().makerLabel(text: "Most Popular", textColor: .systemRed)
    private let upDownButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.up.arrow.down"), for: .normal)
        button.tintColor = .systemRed
        return button
    }()
    let sortedDishes = [Dish(title: "Bowl", image: UIImage(named: "bowl")),
                        Dish(title: "Salmone", image: UIImage(named: "salmone")),
                        Dish(title: "Shashlyk", image: UIImage(named: "shashlyk")),
                        Dish(title: "Meat", image: UIImage(named: "meat")),
                        Dish(title: "Gnocchi", image: UIImage(named: "gnocchi")),
                        Dish(title: "Crab", image: UIImage(named: "crab")),
                        Dish(title: "Salad", image: UIImage(named: "salad")),
                        Dish(title: "Avocado", image: UIImage(named: "avocado")),
                        Dish(title: "Oysters", image: UIImage(named: "oysters")),
                        Dish(title: "Vegetables", image: UIImage(named: "vegetables"))]
    private let collectionView2: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 60)/2, height: 200)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(menuLabel)
        NSLayoutConstraint.activate([
            menuLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menuLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        view.addSubview(searchButton)
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        view.addSubview(collectionView1)
        NSLayoutConstraint.activate([
            collectionView1.topAnchor.constraint(equalTo: menuLabel.bottomAnchor, constant: 15),
            collectionView1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView1.heightAnchor.constraint(equalToConstant: 150)
        ])
        collectionView1.dataSource = self
        collectionView1.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell1")
        
        view.addSubview(sortByLabel)
        NSLayoutConstraint.activate([
            sortByLabel.topAnchor.constraint(equalTo: collectionView1.bottomAnchor, constant: 20),
            sortByLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        view.addSubview(upDownButton)
        NSLayoutConstraint.activate([
            upDownButton.centerYAnchor.constraint(equalTo: sortByLabel.centerYAnchor),
            upDownButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        view.addSubview(mostPopularLabel)
        NSLayoutConstraint.activate([
            mostPopularLabel.centerYAnchor.constraint(equalTo: sortByLabel.centerYAnchor),
            mostPopularLabel.trailingAnchor.constraint(equalTo: upDownButton.leadingAnchor, constant: -10)
        ])
        view.addSubview(collectionView2)
        NSLayoutConstraint.activate([
            collectionView2.topAnchor.constraint(equalTo: sortByLabel.bottomAnchor, constant: 20),
            collectionView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView2.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        collectionView2.dataSource = self
        collectionView2.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell2")
    }
}

extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionView == collectionView1 ? dishes.count : sortedDishes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionView1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! CustomCollectionViewCell
            cell.setImage(dish: dishes[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! CustomCollectionViewCell
            cell.setImage(dish: sortedDishes[indexPath.row])
            return cell
        }
    }
}
