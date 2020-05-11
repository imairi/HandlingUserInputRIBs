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
    
    var body : some View {
        Button(action: {
            self.presenter.didTapDoneButton()
        }, label: {Text("Close")})
    }
}

struct LandmarkRowView: View {
    let landmark: Landmark

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()

            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkListView: View {
    @ObservedObject var presenter: LandmarkListPresenter
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $presenter.isOn) {
                    Text("Show Favorites Only")
                }
                ForEach(presenter.landmarks) { landmark in
                    LandmarkRowView(landmark: landmark)
                }
            }
            .navigationBarTitle(Text("Landmarks"))
            .navigationBarItems(trailing: NavigationBarButtonItem(presenter: presenter))
        }
    }
}

struct LandmarksListView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
