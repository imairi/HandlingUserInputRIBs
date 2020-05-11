//
//  LandmarkListPresenter.swift
//  Landmarks
//
//  Created by 今入　庸介 on 2020/03/01.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

protocol LandmarkListPresentableListener: class {
    func close()
    func filterLandmarks(isFavoriteOnly: Bool)
    func showLandmark(_ landmark: Landmark)
}

final class LandmarkListPresenter: ObservableObject, LandmarkListPresentable {
    weak var listener: LandmarkListPresentableListener?
    
    @Published private(set) var landmarks: [Landmark] = []
    @Published var isOn: Bool = false
    
    private var cancellables: [AnyCancellable] = []
    
    init() {
        setUpBindings()
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
    
    private func setUpBindings() {
        let toggleCancellable = $isOn.sink { [unowned self] isOn in
            self.listener?.filterLandmarks(isFavoriteOnly: isOn)
        }
        cancellables.append(toggleCancellable)
    }
}

// MARK: - Internal
extension LandmarkListPresenter {
    func didTapCloseButton() {
        listener?.close()
    }
    
    func didTapLandmark(_ landmark: Landmark) {
        listener?.showLandmark(landmark)
    }
}

// MARK: - LandmarkListPresentable
extension LandmarkListPresenter {
    func updateLandmarks(landmarks: [Landmark]) {
        self.landmarks = landmarks
    }
}
