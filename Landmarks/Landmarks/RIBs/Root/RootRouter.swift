//
//  Copyright (c) 2017. Uber Technologies
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import RIBs

protocol RootInteractable: Interactable, LandmarkListListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    private let landmarkListBuilder: LandmarkListBuildable
    private var landmarkList: ViewableRouting?
    
    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         landmarkListBuilder: LandmarkListBuildable) {
        self.landmarkListBuilder = landmarkListBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    override func didLoad() {
        super.didLoad()

        routeToLandmarkList()
    }
}

// MARK: - LandmarkListRouting
extension RootRouter {
    func routeToLandmarkList() {
        let landmarkList = landmarkListBuilder.build(withListener: interactor)
        self.landmarkList = landmarkList
        attachChild(landmarkList)
        viewController.present(viewController: landmarkList.viewControllable)
    }
    
    func finishLandmarkList() {
        guard let landmarkList = landmarkList else {
            return
        }
        viewController.dismiss(viewController: landmarkList.viewControllable)
        detachChild(landmarkList)
    }
}
