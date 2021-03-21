//
//  DetailCollectionViewCell.swift
//  MyFriends
//
//  Created by Frank Abrams on 11.03.2021.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    
    func createMyCell(_ item: Friends) {
        
        detailLabel.text = item.lastName + " " + item.firstName
        detailImageView.image = UIImage(named: item.picture)
        detailImageView.backgroundColor = UIColor.blue
        detailImageView.layer.cornerRadius = detailImageView.frame.width / 2
    }
}
