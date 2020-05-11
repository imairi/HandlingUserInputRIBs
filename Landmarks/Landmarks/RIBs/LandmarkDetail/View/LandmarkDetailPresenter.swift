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
import CoreLocation

protocol LandmarkDetailPresentableListener: class {
    func close()
    func toggleFavorite()
}

final class LandmarkDetailPresenter: ObservableObject, LandmarkDetailPresentable {
    weak var listener: LandmarkDetailPresentableListener?
    
    @Published private(set) var landmark: Landmark?
}

// MARK: - Internal
extension LandmarkDetailPresenter {
    var landmarkParkName: String {
        landmark?.park ?? ""
    }
    
    var landmarkState: String {
        landmark?.state ?? ""
    }
    
    var landmarkName: String {
        landmark?.name ?? ""
    }
    
    var landmarkImage: Image {
        landmark?.image ?? .init("")
    }
    
    var landmarkLocation: CLLocationCoordinate2D {
        landmark?.locationCoordinate ?? .init(latitude: 35.0, longitude: 135.0)
    }
    
    var isFavorite: Bool {
        landmark?.isFavorite ?? false
    }
    
    func didTapBackButton() {
        listener?.close()
    }
    
    func didTapFavoriteButton() {
        listener?.toggleFavorite()
    }
}

// MARK: - LandmarkDetailPresentable
extension LandmarkDetailPresenter {
    func update(landmark: Landmark) {
        self.landmark = landmark
    }
}
