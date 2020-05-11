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
    
    private var landmarks: [Landmark] = []

    override init(presenter: LandmarkListPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        
        landmarks = loadJSON("landmarkData.json")
        presenter.updateLandmarks(landmarks: landmarks)
    }

    override func willResignActive() {
        super.willResignActive()
    }
}

// MARK: - Internal
extension LandmarkListInteractor {
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
            let favoriteLandmarks = landmarks.filter { $0.isFavorite }
            presenter.updateLandmarks(landmarks: favoriteLandmarks)
        } else {
            presenter.updateLandmarks(landmarks: landmarks)
        }
    }
    
    func showLandmark(_ landmark: Landmark) {
        router?.routeToLandmarkDetail(landmark: landmark)
    }
}
