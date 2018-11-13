//
//  TabView.swift
//  MusicApp
//
//  Created by LeeX on 11/14/18.
//  Copyright © 2018 Huy Le Hoang. All rights reserved.
//

import Foundation

protocol TabDelegate: NSObjectProtocol {
    func tabView(didChanged index: Int)
}

class TabView: UIView {
    
    weak var delegate: TabDelegate?
    fileprivate var tabItemViews = [TabItemView]()
    fileprivate var currentIndex = 0
    
    var isEnabled: Bool = true {
        didSet {
            isUserInteractionEnabled = isEnabled
            tabItemViews[currentIndex].isSelectedTab = isEnabled
        }
    }
    
    init(items: [TabItem]) {
        super.init(frame: CGRect.zero)
        
        items.forEach { (item) in
            let tabItemView = TabItemView(item: item)
            tabItemView.delegate = self
            tabItemViews.append(tabItemView)
            addSubview(tabItemView)
        }
        
        tabItemViews[0].snp.makeConstraints { (make) in
            make.top.equalToSuperView().inset(5)
            make.right.equalToSuperView().inset(22)
            make.bottom.equalToSuperView().inset(9)
        }
        
        tabItemViews[tabItemViews.count - 1].snp.makeConstraints { (make) in
            make.left.equalTo(tabItemViews[tabItemViews.count - 2].snp.right).inset(105)
            make.top.right.bottom.equalToSuperview().inset(5)
            make.width.equalTo(tabItemViews[0])
        }
        
        for i in 1..<(tabItemViews.count - 1) {
            tabItemViews[i].snp.makeConstraints { (make) in
                make.left.equalTo(tabItemViews[i - 1].snp.right).inset(105)
                make.top.equalToSuperView().inset(5)
                make.bottom.equalToSuperview().inset(22)
                make.width.equalTo(tabItemViews[0])
            }
        }
        
        tabItemViews[currentIndex].isSelectedTab = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func selectTab(at index: Int) {
        if index == currentIndex {
            return
        }
        tabItemViews[currentIndex].isSelectedTab = false
        currentIndex = index
        tabItemViews[currentIndex].isSelectedTab = true
    }
}

extension TabView: TabDelegate {
    internal func tabView(didChanged index: Int) {
        if index == currentIndex {
            return
        }
        selectTab(at: index)
        delegate?.tabView(didChanged: index)
    }
}
