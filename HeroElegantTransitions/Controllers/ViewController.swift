//
//  ViewController.swift
//  HeroElegantTransitions
//
//  Created by Yury Popov on 21.10.2019.
//  Copyright © 2019 Iurii Popov. All rights reserved.
//

import UIKit
import Hero

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var movies: [Movie]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchData { (movie) in
            self.movies = movie
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
        let movie = movies[indexPath.row]
        cell.hero.id = "ironMan"
        cell.movieImage.layer.cornerRadius = 20
        
        cell.movieName.hero.id = "batMan"
        cell.movieName.layer.masksToBounds = true
        cell.movieName.layer.cornerRadius = 20
        cell.configure(with: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc2 = SecondViewController()
        vc2.hero.isEnabled = true
        vc2.movie = movies[indexPath.row]
        present(vc2, animated: true)
    }
    
}




