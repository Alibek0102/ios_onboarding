//
//  ViewController.swift
//  Onboarding
//
//  Created by Алибек Аблайулы on 26.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let educationImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "eduImage"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        
        let attributedTexts = NSMutableAttributedString(string: "Empowering Minds: The Transformative Power of Education", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
        
        attributedTexts.append(NSAttributedString(string: "\n\n\n\nEducation is the key to unlocking the potential within each individual. It is a journey that empowers minds, nurtures curiosity, and ignites a passion for learning.", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15),
            NSAttributedString.Key.foregroundColor: UIColor.gray
        ]))
        
        textView.attributedText = attributedTexts
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let prevButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(UIColor(hexString: "#2176c4"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let pageControle: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = UIColor(hexString: "#2176c4")
        pc.pageIndicatorTintColor = UIColor(hexString: "#9bc3e8")
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(educationImage)
        view.addSubview(textView)
        setConstraints()
        setBottomControls()
    }
    
    fileprivate func setBottomControls(){
    
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [
            prevButton, pageControle, nextButton
        ])
        
        bottomControlsStackView.distribution = .fillEqually
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setConstraints(){
        
        let topView: UIView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(topView)
        
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        
        educationImage.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        educationImage.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        educationImage.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.4).isActive = true
        
        textView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        textView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        textView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
}

