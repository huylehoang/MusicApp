//
//  TabItemView.swift
//  MusicApp
//
//  Created by LeeX on 11/14/18.
//  Copyright © 2018 Huy Le Hoang. All rights reserved.
//

import Foundation
import UIKit

class TabItemView: UIButton {
    
    internal let iconView = UIImageView()
    private let label = UILabel()
    private let tabItem: TabItem
    
     weak var delegate: TabDelegate?
    
    private let normalStyle = Style {
        $0.font = MyFontFamily.regular.font(size: 11)
        $0.color = mainGrayColor
    }
    
    private let selectedStyle = Style {
        $0.font = MyFontFamily.regular.font(size: 11)
        $0.color = mainYellowColor
    }
    
    var isSelectedTab: Bool = false {
        didSet {
            
        }
    }
    
    init(item: TabItem) {
        tabItem = item
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize() {
        iconView.clipsToBounds = true
        iconView.contentMode = .scaleAspectFit
    }
    
    private func update() {
        label.attributedText = tabItem.title.set(style: isSelectedTab ? selectedStyle : normalStyle)
        iconView.tintColor = isSelectedTab ? mainYellowColor : mainGrayColor
    }
    
    private func createConstraint() {
        addSubview(iconView)
        addSubview(label)
        
        iconView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview().inset(7).priority(500)
            make.bottom.equalToSuperview().inset(16)
            make.centerX.equalToSuperview()
        }
        label.snp.makeConstraints { (make) in
            make.top.equalTo(iconView.snp.bottom).inset(3)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    @objc private func pressed() {
        if !isSelectedTab {
            delegate?.tabView(didChanged: tabItem.index)
        }
    }
}
