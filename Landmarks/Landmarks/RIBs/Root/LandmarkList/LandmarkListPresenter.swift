//
//  Person.swift
//  Landmarks
//
//  Created by 今入　庸介 on 2020/03/01.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import SwiftUI

protocol LandmarkListPresentableListener: class {
    func changeText()
}


final class LandmarkListPresenter: ObservableObject {
    weak var listener: LandmarkListPresentableListener?
    
    @Published private(set) var text: String = ""
    @Published private(set) var color: Color = .clear
    
    func didTapButton() {
        listener?.changeText()
    }
}

// MARK: - LandmarkListPresentable
extension LandmarkListPresenter: LandmarkListPresentable {
    func changeForegroundColor() {
        color = .red
    }
    
    func updateText(text: String) {
        self.text = text
    }
}
