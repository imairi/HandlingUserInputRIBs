//
//  LandmarkListView.swift
//  Landmarks
//
//  Created by 今入　庸介 on 2020/02/29.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct NavigationBarButtonItem : View {
    @ObservedObject var presenter: LandmarkListPresenter
    
    init(presenter: LandmarkListPresenter) {
        self.presenter = presenter
    }
    
    var body : some View {
        Button(action: {
            self.presenter.didTapDoneButton()
        }, label: {Text("Done")})
    }
}

struct LandmarkListView: View {
    @ObservedObject var presenter: LandmarkListPresenter
    
    init(presenter: LandmarkListPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text(presenter.text)
                Button(action: {
                    self.presenter.didTapButton()
                }) {
                    Text("aaaaaaaa")
                }
            }
            .background(presenter.color)
            .navigationBarTitle(Text("Landmarks"))
            .navigationBarItems(trailing: NavigationBarButtonItem(presenter: presenter))
        }
    }
}

// MARK: - Previews
struct LandmarkListSample_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = LandmarkListPresenter()
        let landmarkList = LandmarkListView(presenter: presenter)
        presenter.updateText(text: "ccc")
        presenter.changeForegroundColor()
        return landmarkList.previewLayout(.sizeThatFits)
    }
}
