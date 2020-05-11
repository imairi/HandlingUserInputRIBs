//
//  LandmarkDetailViewController.swift
//  Landmarks
//
//  Created by 今入　庸介 on 2020/05/11.
//  Copyright © 2020 Apple. All rights reserved.
//

import RIBs
import RxSwift
import RxCocoa
import UIKit
import SwiftUI
import SnapKit

final class LandmarkDetailViewController: UIHostingController<LandmarkDetailView>, LandmarkDetailViewControllable {

    weak var listener: LandmarkDetailPresentableListener?
    
    private let closeBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpNavigationBar()
    }
    
    // MARK: - Private Methods
    func setUpNavigationBar() {
        navigationItem.title = "Landmark Detail"
        navigationItem.leftBarButtonItem = closeBarButtonItem
        
        closeBarButtonItem.rx.tap.asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [unowned self] _ in
                self.rootView.presenter.didTapBackButton()
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - LandmarkDetailViewControllable
extension LandmarkDetailViewController {
}


