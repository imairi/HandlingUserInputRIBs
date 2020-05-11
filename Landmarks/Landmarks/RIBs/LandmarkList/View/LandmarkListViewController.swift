//
//  LandmarkListViewController.swift
//  Landmarks
//
//  Created by 今入　庸介 on 2020/02/29.
//  Copyright © 2020 Apple. All rights reserved.
//

import RIBs
import RxSwift
import RxCocoa
import UIKit
import SwiftUI
import SnapKit

final class LandmarkListViewController: UIHostingController<LandmarkListView>, LandmarkListViewControllable {
    
    private let closeBarButtonItem = UIBarButtonItem(title: "Close", style: .done, target: nil, action: nil)
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpNavigationBar()
    }
    
    // MARK: - Private Methods
    func setUpNavigationBar() {
        navigationItem.title = "Landmark List"
        navigationItem.leftBarButtonItem = closeBarButtonItem
        
        closeBarButtonItem.rx.tap.asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [unowned self] _ in
                self.rootView.presenter.didTapDoneButton()
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - LandmarkListViewControllable
extension LandmarkListViewController {
    func present(viewController: ViewControllable) {
        viewController.uiviewController.modalPresentationStyle = .fullScreen
        present(viewController.uiviewController, animated: true, completion: nil)
    }

    func dismiss(viewController: ViewControllable) {
        viewController.uiviewController.dismiss(animated: true, completion: nil)
    }
}


