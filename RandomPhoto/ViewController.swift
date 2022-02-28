//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Nigar Safarova on 28.02.22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Tap for Random Photo!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let color: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemTeal,
        .systemRed,
        .systemCyan,
        .systemGray,
        .systemMint,
        .systemIndigo,
        .systemPurple,
        .systemOrange,
        .systemYellow,
        .systemBrown,
        .systemGray3
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 360, height: 360)
        imageView.center = view.center
        view.addSubview(button)
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        getRandomPhoto()
        
        view.backgroundColor = color.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(x: 30,
                              y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)
    }
    
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/630x630"
        let url = URL(string: urlString)! //! means that url exists
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
}

