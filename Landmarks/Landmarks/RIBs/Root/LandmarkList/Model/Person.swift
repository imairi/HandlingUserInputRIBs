//
//  Person.swift
//  Landmarks
//
//  Created by 今入　庸介 on 2020/03/01.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import SwiftUI

struct PersonModel: Identifiable {
    var id: Int
    var name: String
    var age: Int
    var sex: String
    var location: String
    var job: String
}

let personsMock: [PersonModel] = [
    PersonModel(id: 1, name: "佐藤浩介", age: 30, sex: "男性", location: "東京都", job: "会社員"),
    PersonModel(id: 2, name: "鈴木絵里", age: 21, sex: "女性", location: "大阪府", job: "大学生"),
    PersonModel(id: 3, name: "高橋美沙子", age: 33, sex: "女性", location: "静岡県", job: "主婦"),
    PersonModel(id: 4, name: "田中優作", age: 55, sex: "男性", location: "福岡県", job: "会社役員"),
    PersonModel(id: 5, name: "渡辺大毅", age: 17, sex: "男性", location: "埼玉県", job: "高校生"),
    PersonModel(id: 6, name: "中村真衣", age: 27, sex: "女性", location: "秋田県", job: "公務員"),
    PersonModel(id: 7, name: "山崎敏子", age: 72, sex: "女性", location: "広島県", job: "無職"),
    PersonModel(id: 8, name: "山田誠司", age: 46, sex: "男性", location: "北海道", job: "自営業")
]

final class PersonListViewModel: ObservableObject {

    @Published private(set) var text: String = ""
    @Published private(set) var color: Color = .clear
    
    // リストに表示するデータ
    @Published private(set) var persons: [PersonModel] = []
    
    // リストの各行の詳細を表示するフラグ
    @Published var isShowDetail = false
    
    // 詳細ポップアップに表示するメッセージ
    @Published private(set) var message = ""
    
    func loadPersons() {
        // 通常はRealmSwiftやWebAPIなりで取得するが今回はモックデータを代入。
        self.persons = personsMock
    }
    
    func showDetail(person: PersonModel) {
        // Alertに表示するメッセージを作成
        var msg = "【氏名】：\(person.name)\n"
        msg += "【年齢】：\(person.age)歳\n"
        msg += "【性別】：\(person.sex)\n"
        msg += "【出身】：\(person.location)\n"
        msg += "【職業】：\(person.job)"
        self.message = msg
        
        // View側のAlertに紐づいているのでtrueにするとAlertが表示される
        self.isShowDetail = true
    }
}

