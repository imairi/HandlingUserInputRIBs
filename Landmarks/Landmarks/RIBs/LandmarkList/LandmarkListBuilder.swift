//
//  LandmarkListBuilder.swift
//  Landmarks
//
//  Created by 今入　庸介 on 2020/02/29.
//  Copyright © 2020 Apple. All rights reserved.
//

import RIBs

protocol LandmarkListDependency: LandmarkListDependencyLandmarkDetail {
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
        let presenter = LandmarkListPresenter()
        let view = LandmarkListView(presenter: presenter)
        let viewController = LandmarkListViewController(rootView: view)
        let interactor = LandmarkListInteractor(presenter: presenter)
        interactor.listener = listener
        let landmarkDetailBuilder = LandmarkDetailBuilder(dependency: component)
        return LandmarkListRouter(interactor: interactor,
                                  viewController: viewController,
                                  landmarkDetailBuilder: landmarkDetailBuilder)
    }
}
