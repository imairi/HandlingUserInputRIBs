//
//  LandmarkDetailView.swift
//  Landmarks
//
//  Created by 今入　庸介 on 2020/05/11.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkDetailView: View {
    @ObservedObject var presenter: LandmarkDetailPresenter
    
    var body: some View {
        Text("landmark detail")
    }
}

struct LandmarkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = LandmarkDetailPresenter()
        return LandmarkDetailView(presenter: presenter)
    }
}
