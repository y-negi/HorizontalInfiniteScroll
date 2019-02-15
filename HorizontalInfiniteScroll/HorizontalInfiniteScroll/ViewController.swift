//
//  ViewController.swift
//  HorizontalInfiniteScroll
//
//  Created by 根岸 裕太 on 2019/02/13.
//  Copyright © 2019年 根岸 裕太. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 画面に表示しきってしまう場合は無限スクロールしないようにしないといけない
    let ds = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    @IBOutlet weak var sampleCollectionView: UICollectionView! {
        didSet {
            sampleCollectionView.register(UINib(nibName: "SampleCollectionViewCell", bundle: nil),
                                          forCellWithReuseIdentifier: "SampleCollectionViewCell")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // データソースの数にかけた数分表示する。今回は画面に表示するデータ数が多いので4倍にしている。
        return ds.count * 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SampleCollectionViewCell", for: indexPath) as! SampleCollectionViewCell
        
        // OutOfRangeしないように実際のDataSourceのindexになおす。
        var index = indexPath.item
        if index > ds.count - 1 {
            index -= ds.count
        }
        cell.textLabel.text = ds[index % ds.count]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        // cellが表示される前のタイミングで位置を確認し、offsetをずらす。
        var offset = collectionView.contentOffset
        let width = collectionView.contentSize.width
        // 実際のデータソースの50%に届いたら-25%ずらす
        if offset.x < width / 8 {
            offset.x += width / 4
            collectionView.setContentOffset(offset, animated: false)
        } else if offset.x > width / 8 * 4 {// 実際のデータソースの-50%に届いたら25%ずらす
            offset.x -= width / 4
            collectionView.setContentOffset(offset, animated: false)
        }
    }
    
}

