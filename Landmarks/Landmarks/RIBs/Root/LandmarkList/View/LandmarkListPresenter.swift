//
//  Person.swift
//  Landmarks
//
//  Created by 今入　庸介 on 2020/03/01.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import SwiftUI

protocol LandmarkListPresentableListener: class {
    func close()
}


//final class UserData: ObservableObject {
//    @Published var showFavoritesOnly = false
//    @Published var landmarks = landmarkData
//}

final class LandmarkListPresenter: ObservableObject {
    weak var listener: LandmarkListPresentableListener?
    
    @Published private(set) var landmarks: [Landmark] = []
    
    func didTapDoneButton() {
        listener?.close()
    }
}

// MARK: - LandmarkListPresentable
extension LandmarkListPresenter: LandmarkListPresentable {
    func updateLandmarks(landmarks: [Landmark]) {
        self.landmarks = landmarks
    }
}
