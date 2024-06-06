//
//  ImageCollectionViewCell.swift
//  TestsSwiftUIkit
//
//  Created by Adrian Prieto Villena on 6/6/24.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var animeImageView: UIImageView!
    
    func setupCell(imageName: String) {
        animeImageView.image = UIImage(named: imageName)
    }
}
