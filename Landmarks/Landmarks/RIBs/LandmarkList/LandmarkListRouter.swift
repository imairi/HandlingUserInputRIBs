//
//  LandmarkListRouter.swift
//  Landmarks
//
//  Created by 今入　庸介 on 2020/02/29.
//  Copyright © 2020 Apple. All rights reserved.
//

import RIBs

protocol LandmarkListInteractable: Interactable, LandmarkDetailListener {
    var router: LandmarkListRouting? { get set }
    var listener: LandmarkListListener? { get set }
}

protocol LandmarkListViewControllable: ViewControllable {
    func push(viewController: ViewControllable, from fromViewController: ViewControllable)
    func pop(from fromViewController: ViewControllable)
}

final class LandmarkListRouter: ViewableRouter<LandmarkListInteractable, LandmarkListViewControllable>, LandmarkListRouting {
    
    private let landmarkDetailBuilder: LandmarkDetailBuildable
    private weak var landmarkDetail: Routing?
    
    init(interactor: LandmarkListInteractable,
         viewController: LandmarkListViewControllable,
         landmarkDetailBuilder: LandmarkDetailBuildable) {
        self.landmarkDetailBuilder = landmarkDetailBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

// MARK: - LandmarkListRouting
extension LandmarkListRouter {
    func routeToLandmarkDetail(landmark: Landmark) {
        let landmarkDetail = landmarkDetailBuilder.build(withListener: interactor)
        attachChild(landmarkDetail)
        self.landmarkDetail = landmarkDetail
        viewController.push(viewController: landmarkDetail.viewControllable, from: viewController)
    }
}
