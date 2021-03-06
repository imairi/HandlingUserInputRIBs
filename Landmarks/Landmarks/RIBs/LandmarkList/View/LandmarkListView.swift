//
//  LandmarkListView.swift
//  Landmarks
//
//  Created by 今入　庸介 on 2020/02/29.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

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
        List {
            Toggle(isOn: $presenter.isOn) {
                Text("Show Favorites Only")
            }
            ForEach(presenter.landmarks) { landmark in
                LandmarkRowView(landmark: landmark)
                    .overlay(
                        Button(action: {
                            self.presenter.didTapLandmark(landmark)
                        }, label: {
                            Text("")
                        })
                )
            }
        }
    }
}

struct LandmarksListView_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = LandmarkListPresenter()
        let landmark = Landmark(id: 0,
                                name: "公園",
                                imageName: "",
                                coordinates: .init(latitude: 35.0, longitude: 135.0),
                                state: "",
                                park: "",
                                category: .mountains,
                                isFavorite: true)
        presenter.updateLandmarks(landmarks: [landmark, landmark, landmark])
        return LandmarkListView(presenter: presenter)
    }
}
