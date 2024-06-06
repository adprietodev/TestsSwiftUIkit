//
//  CarrouselViewController.swift
//  TestsSwiftUIkit
//
//  Created by Adrian Prieto Villena on 6/6/24.
//

import UIKit

class CarrouselViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var carrouselCollectionView: UICollectionView!
    @IBOutlet weak var carrouselPageControl: UIPageControl!

    // MARK: - Properties
    let images = ["goblinSlayer","makima","rezeChainSawMan","skullOnePiece","zeroTwoDarling"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureCollectionView()
    }
    

    func setupUI() {
        carrouselPageControl.numberOfPages = images.count
        carrouselPageControl.currentPage = 0
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = true
    }

    func configureCollectionView() {
        carrouselCollectionView.delegate = self
        carrouselCollectionView.dataSource = self
        carrouselCollectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        if let layout = carrouselCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
        }
        carrouselCollectionView.isPagingEnabled = true
    }

}

extension CarrouselViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = carrouselCollectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.setupCell(imageName: images[indexPath.row])
        var frame = cell.frame
        frame.origin.y = collectionView.bounds.origin.y
        cell.frame = frame
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        carrouselPageControl.currentPage = page
    }
}
