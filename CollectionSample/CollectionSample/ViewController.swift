//
//  ViewController.swift
//  CollectionSample
//
//  Created by ko on 2019/01/16.
//  Copyright © 2019年 ko. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    struct Sample {
        var thumbnail: UIImage?
        var textLabel: String
    }
    
    private var dataSource = [Sample(thumbnail: nil, textLabel: "smaple1"),
                              Sample(thumbnail: nil, textLabel: "smaple2"),
                              Sample(thumbnail: nil, textLabel: "smaple3")]

    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            self.collectionView.register(UINib(nibName: SampleCollectionViewCell.kCellIdentifier, bundle: nil),
                                         forCellWithReuseIdentifier: SampleCollectionViewCell.kCellIdentifier)
            (self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout).estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SampleCollectionViewCell.kCellIdentifier, for: indexPath) as! SampleCollectionViewCell

        let sample = dataSource[indexPath.row]
        
        cell.thumbnail = sample.thumbnail
        cell.labelText = sample.textLabel
        
        return cell
    }
    
}

