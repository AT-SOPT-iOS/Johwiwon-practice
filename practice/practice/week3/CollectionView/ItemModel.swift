//
//  TestModel.swift
//  practice
//
//  Created by 조휘원 on 4/26/25.
//

import UIKit

struct ItemModel {
    let itemImg: UIImage
    let name: String
    let price: String
    var heartIsSelected: Bool
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(
                itemImg: .img1,
                name: "퉁퉁퉁사후르",
                price: "5000",
                heartIsSelected: false
            ),
            ItemModel(
                itemImg: .img2,
                name: "오쏘몰",
                price: "5000",
                heartIsSelected: false
            ),
            ItemModel(
                itemImg: .img1,
                name: "퉁퉁퉁사후르",
                price: "5000",
                heartIsSelected: false
            ),
            ItemModel(
                itemImg: .img2,
                name: "오쏘몰",
                price: "5000",
                heartIsSelected: false
            ),
            ItemModel(
                itemImg: .img1,
                name: "퉁퉁퉁사후르",
                price: "5000",
                heartIsSelected: false
            ),
            ItemModel(
                itemImg: .img2,
                name: "오쏘몰",
                price: "5000",
                heartIsSelected: false
            ),
            ItemModel(
                itemImg: .img1,
                name: "퉁퉁퉁사후르",
                price: "5000",
                heartIsSelected: false
            ),
            ItemModel(
                itemImg: .img2,
                name: "오쏘몰",
                price: "5000",
                heartIsSelected: false
            ),
        ]
    }
}
