//
//  LandmarkDetailInteractor.swift
//  Landmarks
//
//  Created by 今入　庸介 on 2020/05/11.
//  Copyright © 2020 Apple. All rights reserved.
//

import RIBs
import RxSwift

protocol LandmarkDetailRouting: ViewableRouting {
}

protocol LandmarkDetailPresentable: Presentable {
    var listener: LandmarkDetailPresentableListener? { get set }
    
    func update(landmark: Landmark)
}

protocol LandmarkDetailListener: class {
    func closeLandmarkDetail()
}

final class LandmarkDetailInteractor: PresentableInteractor<LandmarkDetailPresentable>, LandmarkDetailInteractable, LandmarkDetailPresentableListener {

    weak var router: LandmarkDetailRouting?
    weak var listener: LandmarkDetailListener?
    
    private var landmark: Landmark
    private let mutableLandmarkStream: MutableLandmarkStream
    
    init(presenter: LandmarkDetailPresentable,
         landmark: Landmark,
         mutableLandmarkStream: MutableLandmarkStream) {
        self.landmark = landmark
        self.mutableLandmarkStream = mutableLandmarkStream
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        presenter.update(landmark: landmark)
    }

    override func willResignActive() {
        super.willResignActive()
    }
}

// MARK: - LandmarkDetailPresentableListener
extension LandmarkDetailInteractor {
    func close() {
        listener?.closeLandmarkDetail()
    }
    
    func toggleFavorite() {
        landmark.isFavorite.toggle()
        presenter.update(landmark: landmark)
        mutableLandmarkStream.update(landmark: landmark)
    }
}
