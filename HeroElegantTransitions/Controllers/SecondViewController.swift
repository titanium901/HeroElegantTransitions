//
//  SecondViewController.swift
//  HeroElegantTransitions
//
//  Created by Yury Popov on 21.10.2019.
//  Copyright © 2019 Iurii Popov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let pinkView = UIView()
    let blackView = UIView()
    let whiteView = UIView()
    let imageView = UIImageView()
    let textView = UITextView()
    let dismissButton = UIButton(type: .system)
    
    var movie: Movie! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        pinkView.backgroundColor = UIColor.systemPink
        pinkView.hero.id = "ironMan"
        view.addSubview(pinkView)

        blackView.backgroundColor = UIColor.black
        blackView.hero.id = "batMan"
        blackView.layer.cornerRadius = 8
        view.addSubview(blackView)
        
        whiteView.addSubview(imageView)
       
        blackView.addSubview(textView)

        whiteView.backgroundColor = .white
       
        // .useGlobalCoordinateSpace modifier is needed here otherwise it will be covered by redView during transition.
        // see http://lkzhao.com/2018/03/02/hero-useglobalcoordinatespace-explained.html for detail
        whiteView.hero.modifiers = [.translate(y: 500), .useGlobalCoordinateSpace]
        view.addSubview(whiteView)
        
        dismissButton.setTitle("Back", for: .normal)
        dismissButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        dismissButton.hero.id = "back button"
        dismissButton.titleLabel?.font = dismissButton.titleLabel?.font.withSize(40)
        self.view.addSubview(dismissButton)
        
        guard let imageURL = URL(string: movie.imageurl) else { return }
        guard let imageData = try? Data(contentsOf: imageURL) else { return }
        imageView.image = UIImage(data: imageData)
    }
    
    override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
        pinkView.frame = UIScreen.main.bounds
        blackView.frame.size = CGSize(width: 354, height: 200)
        blackView.center = CGPoint(x: view.bounds.midX, y: 130)
        
        textView.center = CGPoint(x: blackView.bounds.midX, y: blackView.bounds.midY)
        textView.textAlignment = .center
        textView.textColor = .white
        textView.frame.size = CGSize(width: blackView.frame.width, height: blackView.frame.height)
        textView.text = movie.bio
        textView.font = .systemFont(ofSize: 20)
        textView.backgroundColor = .black
        textView.isEditable = false
        
        whiteView.frame.size = CGSize(width: 354, height: 200)
        whiteView.center = pinkView.center
        whiteView.layer.cornerRadius = 20
        
        imageView.frame = CGRect(x: 0, y: 0, width: 354, height: 200)
        imageView.backgroundColor = .orange
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20
        
        dismissButton.frame = CGRect(x: self.view.bounds.midX - dismissButton.frame.width / 2, y: 600, width: 100, height: 100)
       
        
    }
    
    @objc func back() {
      dismiss(animated: true, completion: nil)
    }

}
