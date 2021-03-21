//
//  FriendsTableViewCell.swift
//  MyFriends
//
//  Created by Frank Abrams on 11.03.2021.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func createMyCell(_ item: Friends) {
        userNameLabel.text = item.lastName + " " + item.firstName
        userImageView.image = UIImage(named: item.picture)
        userImageView.layer.cornerRadius = userImageView.frame.height / 2
    }

}
