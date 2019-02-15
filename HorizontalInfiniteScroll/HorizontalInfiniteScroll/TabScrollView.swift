//
//  TabScrollView.swift
//  HorizontalInfiniteScroll
//
//  Created by 根岸 裕太 on 2019/02/13.
//  Copyright © 2019年 根岸 裕太. All rights reserved.
//

import UIKit

final class TabScrollView: UIView {
    
    // MARK: - initialize
    
    init() {
        super.init(frame: .zero)
        self.loadNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadNib()
    }
    
    // MARK: - Private
    
    /// Xib読み込み
    private func loadNib() {
        guard let view = UINib(nibName: "TabScrollView", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else { return }
        self.addSubview(view)
        
        // subViewになりうるviewにAutoLayoutをコード上で指定する場合はfalseにする
        view.translatesAutoresizingMaskIntoConstraints = false
        
        // inputViewのViewに当てはめた時の、AutoLayout設定（margin: 0, 0, 0, 0）
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}
