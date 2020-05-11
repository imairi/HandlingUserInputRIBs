//
//  LandmarkDetailPresenter.swift
//  Landmarks
//
//  Created by 今入　庸介 on 2020/05/11.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

protocol LandmarkDetailPresentableListener: class {
    func close()
}

final class LandmarkDetailPresenter: ObservableObject, LandmarkDetailPresentable {
    weak var listener: LandmarkDetailPresentableListener?
}

// MARK: - Internal
extension LandmarkDetailPresenter {
    func didTapBackButton() {
        listener?.close()
    }
}

// MARK: - LandmarkDetailPresentable
extension LandmarkListPresenter {
    
}
