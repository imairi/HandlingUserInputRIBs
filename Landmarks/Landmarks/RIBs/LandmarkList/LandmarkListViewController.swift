//
//  LandmarkListViewController.swift
//  Landmarks
//
//  Created by 今入　庸介 on 2020/02/29.
//  Copyright © 2020 Apple. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import SwiftUI
import SnapKit

protocol LandmarkListPresentableListener: class {
}

final class LandmarkListViewController: UIHostingController<LandmarkListSample>, LandmarkListPresentable, LandmarkListViewControllable {

    weak var listener: LandmarkListPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

// MARK: - LandmarkListPresentable
extension LandmarkListViewController {
    func changeForegroundColor() {
        self.view.backgroundColor = .blue
        self.rootView.updateBackgroundColor(color: .black)
        self.rootView.updateForegroundColor(color: .gray)
    }
    
    func updateText() {
        self.rootView.updateText(text: "aaa")
    }
}

