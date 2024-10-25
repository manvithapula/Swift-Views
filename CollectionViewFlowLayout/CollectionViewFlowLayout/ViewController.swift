//
//  ViewController.swift
//  CollectionViewFlowLayout
//
//  Created by admin64 on 21/10/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    //let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
   // flowLayout.estimatedItemSize = CGSize(width: 50, height: 50)
   // flowLayout.itemSize = CGSize(width: self.view.bounds.size.width - 50, height: 77)
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        200
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath)
        if let colorCell = cell as? CustomCell {
            colorCell.cellView.backgroundColor = randomColor
    }
        return cell
    }
    
    var randomColor: UIColor{
        let red: CGFloat = .random(in: 0...1)
        let green: CGFloat = .random(in: 0...1)
        let blue: CGFloat = .random(in: 0...1)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }

}

