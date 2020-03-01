//
//  LandmarkListBuilder.swift
//  Landmarks
//
//  Created by 今入　庸介 on 2020/02/29.
//  Copyright © 2020 Apple. All rights reserved.
//

import RIBs

protocol LandmarkListDependency: Dependency {
}

final class LandmarkListComponent: Component<LandmarkListDependency> {
}

// MARK: - Builder

protocol LandmarkListBuildable: Buildable {
    func build(withListener listener: LandmarkListListener) -> LandmarkListRouting
}

final class LandmarkListBuilder: Builder<LandmarkListDependency>, LandmarkListBuildable {

    override init(dependency: LandmarkListDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LandmarkListListener) -> LandmarkListRouting {
        let component = LandmarkListComponent(dependency: dependency)
        let rootView = LandmarkListSample()
        let viewController = LandmarkListViewController(rootView: rootView)
        let interactor = LandmarkListInteractor(presenter: viewController)
        interactor.listener = listener
        return LandmarkListRouter(interactor: interactor, viewController: viewController)
    }
}
