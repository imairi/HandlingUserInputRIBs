//
//  LandmarkDetailBuilder.swift
//  Landmarks
//
//  Created by 今入　庸介 on 2020/05/11.
//  Copyright © 2020 Apple. All rights reserved.
//

import RIBs

protocol LandmarkDetailDependency: Dependency {
}

final class LandmarkDetailComponent: Component<LandmarkDetailDependency> {
}

// MARK: - Builder

protocol LandmarkDetailBuildable: Buildable {
    func build(withListener listener: LandmarkDetailListener) -> LandmarkDetailRouting
}

final class LandmarkDetailBuilder: Builder<LandmarkDetailDependency>, LandmarkDetailBuildable {

    override init(dependency: LandmarkDetailDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LandmarkDetailListener) -> LandmarkDetailRouting {
        let component = LandmarkDetailComponent(dependency: dependency)
        let viewController = LandmarkDetailViewController()
        let interactor = LandmarkDetailInteractor(presenter: viewController)
        interactor.listener = listener
        return LandmarkDetailRouter(interactor: interactor, viewController: viewController)
    }
}
