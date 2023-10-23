//
//  SwippingViewController.swift
//  Onboarding
//
//  Created by Алибек Аблайулы on 28.07.2023.
//

import UIKit

class SwippingViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(
            ImageName: "eduFirst",
            title: "Empowering Minds: The Transformative Power of Education",
            bodyText: "Education is the key to unlocking the potential within each individual. It is a journey that empowers minds, nurtures curiosity, and ignites a passion for learning."
        ),
        Page(
            ImageName: "eduSecond",
            title: "Learning is the key that unlocks the doors of endless possibilities.",
            bodyText: "Learning is a transformative journey that enriches our minds and shapes our understanding of the world. With each new piece of knowledge we acquire, we expand our horizons and unlock the potential to create a better future."
        ),
        Page(
            ImageName: "eduThird",
            title: "Study diligently, for it is the bridge between ambition and achievement.",
            bodyText: "Study is the cornerstone of knowledge and personal growth. It is a dedicated and purposeful pursuit of understanding that empowers individuals to broaden their horizons and achieve their goals. "
        ),
    ]
    
    let prevButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(UIColor(hexString: "#2176c4"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc func handleNext(){
        let nextPage = pageControle.currentPage + 1
        let indexPath = IndexPath(row: nextPage, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControle.currentPage = nextPage
    }
    
    @objc func handleBack(){
        let prevPage = pageControle.currentPage - 1
        let indexPath = IndexPath(item: prevPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControle.currentPage = prevPage
    }
    
    let pageControle: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 3
        pc.currentPageIndicatorTintColor = UIColor(hexString: "#2176c4")
        pc.pageIndicatorTintColor = UIColor(hexString: "#9bc3e8")
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CellForOnb.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
        setBottomControls()
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CellForOnb
        cell.page = pages[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControle.currentPage = Int(x / view.frame.width)
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
}
