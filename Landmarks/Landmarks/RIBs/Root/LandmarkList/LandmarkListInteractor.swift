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
}

protocol LandmarkListPresentable: Presentable {
    var listener: LandmarkListPresentableListener? { get set }
    
    func changeForegroundColor()
    func updateText(text: String)
}

protocol LandmarkListListener: class {
    func closeLandmarkList()
}

final class LandmarkListInteractor: PresentableInteractor<LandmarkListPresentable>, LandmarkListInteractable, LandmarkListPresentableListener {

    weak var router: LandmarkListRouting?
    weak var listener: LandmarkListListener?

    override init(presenter: LandmarkListPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        let landmarkData: [Landmark] = loadJSON("landmarkData.json")
        presenter.changeForegroundColor()
        presenter.updateText(text: "")
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
    func changeText() {
        presenter.updateText(text: "bbb")
    }
    
    func close() {
        listener?.closeLandmarkList()
    }
}
