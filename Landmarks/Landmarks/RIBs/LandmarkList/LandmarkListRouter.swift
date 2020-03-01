//
//  LandmarkListRouter.swift
//  Landmarks
//
//  Created by 今入　庸介 on 2020/02/29.
//  Copyright © 2020 Apple. All rights reserved.
//

import RIBs

protocol LandmarkListInteractable: Interactable {
    var router: LandmarkListRouting? { get set }
    var listener: LandmarkListListener? { get set }
}

protocol LandmarkListViewControllable: ViewControllable {
}

final class LandmarkListRouter: ViewableRouter<LandmarkListInteractable, LandmarkListViewControllable>, LandmarkListRouting {

    override init(interactor: LandmarkListInteractable, viewController: LandmarkListViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
