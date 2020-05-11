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
        VStack {
            MapView(coordinate: presenter.landmarkLocation)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage(image: presenter.landmarkImage)
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(presenter.landmarkName)
                        .font(.title)
                    
                    Button(action: {
                        self.presenter.didTapFavoriteButton()
                    }) {
                        if presenter.isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                
                HStack(alignment: .top) {
                    Text(presenter.landmarkParkName)
                        .font(.subheadline)
                    Spacer()
                    Text(presenter.landmarkState)
                        .font(.subheadline)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct LandmarkDetailView_Preview: PreviewProvider {
    static var previews: some View {
        let presenter = LandmarkDetailPresenter()
        return LandmarkDetailView(presenter: presenter)
    }
}
