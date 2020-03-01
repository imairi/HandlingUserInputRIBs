//
//  LandmarkListSample.swift
//  Landmarks
//
//  Created by 今入　庸介 on 2020/02/29.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct NavigationBarButtonItem : View {
    var body : some View {
        Button(action: {
            print("Button Tapped")
        }, label: {Text("Done")})
    }
}

struct LandmarkListSample: View {
    private var foregroundColor = Color.green
    private var backgroundColor = Color.red
    private var text: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text(text)
                Button(action: {
                    self.a()
                }) {
                    Text("a")
                }
            }
            .background(backgroundColor)
            .navigationBarItems(trailing: NavigationBarButtonItem())
        }
    }
    
    mutating func updateForegroundColor(color: Color) {
        foregroundColor = color
    }
    
    mutating func updateBackgroundColor(color: Color) {
        backgroundColor = color
    }
    
    mutating func updateText(text: String) {
        self.text = text
    }
    
    func a() {
        print("tap!!")
    }
}

struct LandmarkListSample_Previews: PreviewProvider {
//    static var previews: some View {
//        let userData = UserData()
//        return LandmarkListSample(landmark: userData.landmarks[0])
//            .environmentObject(userData)
//    }
    static var previews: some View {
        var landmarkList = LandmarkListSample()
        landmarkList.updateForegroundColor(color: .red)
        landmarkList.updateBackgroundColor(color: .blue)
        landmarkList.updateText(text: "aaaaa")
        return landmarkList.previewLayout(.sizeThatFits)
    }
}
