//
//  CellForOnb.swift
//  Onboarding
//
//  Created by Алибек Аблайулы on 31.07.2023.
//

import UIKit

class CellForOnb: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let selectPage = page else { return }
            educationImage.image = UIImage(named: selectPage.ImageName)
            
            let attributedTexts = NSMutableAttributedString(string: selectPage.title, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
            
            attributedTexts.append(NSAttributedString(string: "\n\n\n\n\(selectPage.bodyText)", attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15),
                NSAttributedString.Key.foregroundColor: UIColor.gray
            ]))
            
            textView.attributedText = attributedTexts
            textView.textAlignment = .center
        }
    }
    
    private let educationImage: UIImageView = {
        
        let imageView = UIImageView(image: UIImage(named: "eduImage"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        self.addSubview(educationImage)
        self.addSubview(textView)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints(){
        
        let topView: UIView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(topView)
        
        topView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        
        
        educationImage.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        educationImage.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        educationImage.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.5).isActive = true
        
        textView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        textView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        textView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }

    
}
