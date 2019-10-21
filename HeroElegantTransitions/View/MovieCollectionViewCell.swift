//
//  MovieCollectionViewCell.swift
//  HeroElegantTransitions
//
//  Created by Yury Popov on 21.10.2019.
//  Copyright © 2019 Iurii Popov. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    
    func configure(with movie: Movie) {
        movieName?.text = movie.name
        guard let imageURL = URL(string: movie.imageurl) else { return }
        guard let imageData = try? Data(contentsOf: imageURL) else { return }
        movieImage?.image = UIImage(data: imageData)
    }
}
