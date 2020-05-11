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
}

protocol LandmarkDetailListener: class {
}

final class LandmarkDetailInteractor: PresentableInteractor<LandmarkDetailPresentable>, LandmarkDetailInteractable, LandmarkDetailPresentableListener {

    weak var router: LandmarkDetailRouting?
    weak var listener: LandmarkDetailListener?
    
    override init(presenter: LandmarkDetailPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }
}
