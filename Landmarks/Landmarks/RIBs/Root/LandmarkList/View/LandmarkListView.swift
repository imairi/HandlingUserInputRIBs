//
//  LandmarkListView.swift
//  Landmarks
//
//  Created by 今入　庸介 on 2020/02/29.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkListView: View {
    private var backgroundColor = Color.red
    private var text: String = ""
    
    @ObservedObject var presenter: LandmarkListPresenter
    
    init(presenter: LandmarkListPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text(presenter.text)
                Button(action: {
                    self.didTapButton()
                }) {
                    Text("a")
                }
            }
            .background(presenter.color)
        }
    }
    
    func didTapButton() {
        presenter.didTapButton()
    }
}

struct LandmarkListSample_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = LandmarkListPresenter()
        let landmarkList = LandmarkListView(presenter: presenter)
        presenter.updateText(text: "ccc")
        presenter.changeForegroundColor()
        return landmarkList.previewLayout(.sizeThatFits)
    }
}
