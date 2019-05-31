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
    let tenArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    var imageViewArray: [UIImage] = [UIImage(named: "green")!, UIImage(named: "purple")!, UIImage(named: "patty")!]
    var cageArray: [UIImage] = []
    var kittenArray: [UIImage] = []
    var murrayArray: [UIImage] = []
    var imageArrayArray: [[UIImage]] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        addCageArray()
//        addKittenArray()
//        addMurrayArray()
        
        imageArrayArray.append(cageArray)
//        imageArrayArray.append(murrayArray)
//        imageArrayArray.append(kittenArray)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CollectionViewCell
        let usedArray = cageArray
        cell.imageView.image = usedArray[indexPath.row]
        print("Goodbye")
        return cell
    }
    
    func addCageArray() {
        for item in 1...10{
            let random1 = Int.random(in: 100...500)
            let random2 = Int.random(in: 100...500)
            let url = URL(string: "https://www.placecage.com/c/\(random1)/\(random2)")
            let session = URLSession.shared
            let task = session.dataTask(with: url!) { (data: Data?, response: URLResponse?, error: Error?) in
                DispatchQueue.main.async {
                    let image = (UIImage(data: data!)!)
                    self.cageArray.append(image)
                    print("hello")
                    self.collectionView.reloadData()
                }
            }
            task.resume()
        }
    }
    
//    func addKittenArray() {
//        for item in tenArray{
//            let random1 = Int.random(in: 100...500)
//            let random2 = Int.random(in: 100...500)
//            let url = URL(string: "http://placekitten.com/\(random1)/\(random2)")
//            print(url)
//            let session = URLSession.shared
//            let task = session.dataTask(with: url!) { (data: Data?, response: URLResponse?, error: Error?) in
//                DispatchQueue.main.async {
//                    let image = (UIImage(data: data!)!)
//                    self.kittenArray.append(image)
//                }
//            }
//            task.resume()
//        }
//    }
    
//    func addMurrayArray() {
//        for item in tenArray{
//            let random1 = Int.random(in: 100...500)
//            let random2 = Int.random(in: 100...500)
//            let url = URL(string: "https://fillmurray.com/\(random1)/\(random2)")
//            let session = URLSession.shared
//            let task = session.dataTask(with: url!) { (data: Data?, response: URLResponse?, error: Error?) in
//                DispatchQueue.main.async {
//                    let image = (UIImage(data: data!)!)
//                    self.murrayArray.append(image)
//                }
//            }
//            task.resume()
//        }
//    }
    
}

