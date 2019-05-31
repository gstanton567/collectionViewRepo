//
//  ViewController.swift
//  test4
//
//  Created by Grayson Stanton on 5/31/19.
//  Copyright © 2019 Grayson Stanton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var imageViewArray: [UIImage] = [UIImage(named: "green")!, UIImage(named: "purple")!, UIImage(named: "patty")!]
    var cageArray: [UIImage]!
    var kittenArray: [UIImage]!
    var murrayArray: [UIImage]!
    var imageArrayArray : [[UIImage]]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("view loaded")
        collectionView.reloadData()
    }

    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("hello")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageViewArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CollectionViewCell
        cell.imageView.image = imageViewArray[indexPath.row]
        print(indexPath.section)
        return cell
    }
    func addCageArray()
    {
        let random1 = Int.random(in: 100...500)
        let random2 = Int.random(in: 100...500)
        let url = URL(string: "https://www.placecage.com/c/\(random1)/\(random2)")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data: Data?, response: URLResponse?, error: Error?) in
            DispatchQueue.main.async {
                self.cageArray.append(UIImage(data: data!)!)
            }
        }
    }
    
    func addKittenArray()
    {
        let random1 = Int.random(in: 100...500)
        let random2 = Int.random(in: 100...500)
        let url = URL(string: "https://www.placecage.com/c/\(random1)/\(random2)")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data: Data?, response: URLResponse?, error: Error?) in
            DispatchQueue.main.async {
                self.kittenArray.append(UIImage(data: data!)!)
            }
        }
    }
    
    func addMurrayArray()
    {
        let random1 = Int.random(in: 100...500)
        let random2 = Int.random(in: 100...500)
        let url = URL(string: "https://www.placecage.com/c/\(random1)/\(random2)")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data: Data?, response: URLResponse?, error: Error?) in
            DispatchQueue.main.async {
                self.murrayArray.append(UIImage(data: data!)!)
            }
        }
    }

}

