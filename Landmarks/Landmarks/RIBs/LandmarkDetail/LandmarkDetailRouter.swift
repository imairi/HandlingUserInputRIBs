//
//  LandmarkDetailRouter.swift
//  Landmarks
//
//  Created by 今入　庸介 on 2020/05/11.
//  Copyright © 2020 Apple. All rights reserved.
//

import RIBs

protocol LandmarkDetailInteractable: Interactable {
    var router: LandmarkDetailRouting? { get set }
    var listener: LandmarkDetailListener? { get set }
}

protocol LandmarkDetailViewControllable: ViewControllable {
}

final class LandmarkDetailRouter: ViewableRouter<LandmarkDetailInteractable, LandmarkDetailViewControllable>, LandmarkDetailRouting {
    
    override init(interactor: LandmarkDetailInteractable, viewController: LandmarkDetailViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
