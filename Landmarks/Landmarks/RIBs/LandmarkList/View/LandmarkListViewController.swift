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

final class LandmarkListViewController: UIHostingController<LandmarkListView>, LandmarkListViewControllable {
    
    // MARK: - LandmarkListViewControllable
    func present(viewController: ViewControllable) {
        viewController.uiviewController.modalPresentationStyle = .fullScreen
        present(viewController.uiviewController, animated: true, completion: nil)
    }

    func dismiss(viewController: ViewControllable) {
        if presentedViewController === viewController.uiviewController {
            dismiss(animated: true, completion: nil)
        }
    }
}



