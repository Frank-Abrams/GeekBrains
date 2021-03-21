//
//  DetailCollectionViewController.swift
//  MyFriends
//
//  Created by Frank Abrams on 11.03.2021.
//

import UIKit

class DetailCollectionViewController: UICollectionViewController {

    var bufferItem: Friends? // используется для передачи информации из предыдущего контроллера по идентификатору segue
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailFriendCell", for: indexPath) as? DetailCollectionViewCell { // кастим для использования отдельного класса для ячейки
                
            cell.createMyCell(bufferItem!)
            return cell
        }
        return UICollectionViewCell()
    }

}
