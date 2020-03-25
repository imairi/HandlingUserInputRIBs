//
//  LandmarkListInteractor.swift
//  Landmarks
//
//  Created by 今入　庸介 on 2020/02/29.
//  Copyright © 2020 Apple. All rights reserved.
//

import RIBs
import RxSwift

protocol LandmarkListRouting: ViewableRouting {
}

protocol LandmarkListPresentable: Presentable {
    var listener: LandmarkListPresentableListener? { get set }
    
    func changeForegroundColor()
    func updateText()
}

protocol LandmarkListListener: class {
}

final class LandmarkListInteractor: PresentableInteractor<LandmarkListPresentable>, LandmarkListInteractable, LandmarkListPresentableListener {

    weak var router: LandmarkListRouting?
    weak var listener: LandmarkListListener?
    
    private let viewModel: PersonListViewModel
    
    init(presenter: LandmarkListPresentable, viewModel: PersonListViewModel) {
        self.viewModel = viewModel
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        
        presenter.changeForegroundColor()
        presenter.updateText()
        
        viewModel.isShowDetail = true
    }

    override func willResignActive() {
        super.willResignActive()
    }
}
