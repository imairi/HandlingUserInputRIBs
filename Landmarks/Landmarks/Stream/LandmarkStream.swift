//
//  LandmarkStream.swift
//  Landmarks
//
//  Created by 今入　庸介 on 2020/05/11.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

protocol LandmarkStream {
    var landmarks: Observable<[Landmark]> { get }
    var currentLandmarks: [Landmark] { get }
}

protocol MutableLandmarkStream: LandmarkStream {
    func update(landmarks: [Landmark])
    func update(landmark: Landmark)
}

struct LandmarkStreamImpl: MutableLandmarkStream {
    private let landmarksRelay = BehaviorRelay<[Landmark]>(value: [])
    
    var landmarks: Observable<[Landmark]> {
        return landmarksRelay.asObservable()
    }
    
    var currentLandmarks: [Landmark] {
        return landmarksRelay.value
    }
    
    func update(landmarks: [Landmark]) {
        landmarksRelay.accept(landmarks)
    }
    
    func update(landmark: Landmark) {
        var landmarks = landmarksRelay.value
        guard let updatedIndex = landmarks.firstIndex(where: { $0.id == landmark.id }) else {
            return
        }
        landmarks[updatedIndex] = landmark
        landmarksRelay.accept(landmarks)
    }
}
