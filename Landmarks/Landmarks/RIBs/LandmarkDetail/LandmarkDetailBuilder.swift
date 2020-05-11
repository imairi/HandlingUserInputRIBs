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
    fileprivate let landmark: Landmark
    
    init(dependency: LandmarkDetailDependency, landmark: Landmark) {
        self.landmark = landmark
        super.init(dependency: dependency)
    }
}

// MARK: - Builder

protocol LandmarkDetailBuildable: Buildable {
    func build(withListener listener: LandmarkDetailListener, landmark: Landmark) -> LandmarkDetailRouting
}

final class LandmarkDetailBuilder: Builder<LandmarkDetailDependency>, LandmarkDetailBuildable {

    override init(dependency: LandmarkDetailDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LandmarkDetailListener, landmark: Landmark) -> LandmarkDetailRouting {
        let component = LandmarkDetailComponent(dependency: dependency,
                                                landmark: landmark)
        
        let presenter = LandmarkDetailPresenter()
        let rootView = LandmarkDetailView(presenter: presenter)
        let viewController = LandmarkDetailViewController(rootView: rootView)
        
        let interactor = LandmarkDetailInteractor(presenter: presenter,
                                                  landmark: component.landmark)
        interactor.listener = listener
        
        return LandmarkDetailRouter(interactor: interactor, viewController: viewController)
    }
}
