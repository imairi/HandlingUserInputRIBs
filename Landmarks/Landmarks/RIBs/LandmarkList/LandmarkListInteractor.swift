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
    func routeToLandmarkDetail(landmark: Landmark)
    func finishLandmarkDetail()
}

protocol LandmarkListPresentable: Presentable {
    var listener: LandmarkListPresentableListener? { get set }
    
    func updateLandmarks(landmarks: [Landmark])
}

protocol LandmarkListListener: class {
    func closeLandmarkList()
}

final class LandmarkListInteractor: PresentableInteractor<LandmarkListPresentable>, LandmarkListInteractable, LandmarkListPresentableListener {

    weak var router: LandmarkListRouting?
    weak var listener: LandmarkListListener?
    
    private let mutableLandmarkStream: MutableLandmarkStream

    init(presenter: LandmarkListPresentable,
         mutableLandmarkStream: MutableLandmarkStream) {
        self.mutableLandmarkStream = mutableLandmarkStream
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        
        mutableLandmarkStream.landmarks
            .subscribe(onNext: { [unowned self] landmarks in
                self.presenter.updateLandmarks(landmarks: landmarks)
            })
            .disposeOnDeactivate(interactor: self)
        
        loadLandmarks()
    }

    override func willResignActive() {
        super.willResignActive()
    }
}

// MARK: - Internal
extension LandmarkListInteractor {
    func loadLandmarks() {
        let landmarks: [Landmark] = loadJSON("landmarkData.json")
        mutableLandmarkStream.update(landmarks: landmarks)
    }
    
    func loadJSON<T: Decodable>(_ filename: String) -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}

// MARK: - LandmarkListPresentableListener
extension LandmarkListInteractor {
    func close() {
        listener?.closeLandmarkList()
    }
    
    func filterLandmarks(isFavoriteOnly: Bool) {
        if isFavoriteOnly {
            let favoriteLandmarks = mutableLandmarkStream.currentLandmarks.filter { $0.isFavorite }
            presenter.updateLandmarks(landmarks: favoriteLandmarks)
        } else {
            presenter.updateLandmarks(landmarks: mutableLandmarkStream.currentLandmarks)
        }
    }
    
    func showLandmark(_ landmark: Landmark) {
        router?.routeToLandmarkDetail(landmark: landmark)
    }
}

// MARK: - LandmarkDetailListener
extension LandmarkListInteractor {
    func closeLandmarkDetail() {
        router?.finishLandmarkDetail()
    }
}
