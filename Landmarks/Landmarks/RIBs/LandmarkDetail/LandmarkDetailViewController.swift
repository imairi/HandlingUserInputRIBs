//
//  LandmarkDetailViewController.swift
//  Landmarks
//
//  Created by 今入　庸介 on 2020/05/11.
//  Copyright © 2020 Apple. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol LandmarkDetailPresentableListener: class {
}

final class LandmarkDetailViewController: UIViewController, LandmarkDetailPresentable, LandmarkDetailViewControllable {

    weak var listener: LandmarkDetailPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}
