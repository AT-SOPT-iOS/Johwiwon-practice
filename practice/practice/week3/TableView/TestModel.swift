//
//  TestModel.swift
//  practice
//
//  Created by 조휘원 on 4/26/25.
//

import UIKit

struct ChatModel {
    let profileImg: UIImage
    let name: String
    let place: String
    let message: String
    let itemImg: UIImage
}

extension ChatModel {
    static func dummy() -> [ChatModel] {
        return [
            ChatModel(
                profileImg: .profile1,
                name: "김가현",
                place: "광진구",
                message: "내말에답장해줘",
                itemImg: .img1
            ),
            ChatModel(
                profileImg: .profile2,
                name: "김가현",
                place: "광진구",
                message: "내말에답장해줘",
                itemImg: .img2
            ),
            ChatModel(
                profileImg: .profile3,
                name: "김가현",
                place: "광진구",
                message: "내말에답장해줘",
                itemImg: .img3
            ),
            ChatModel(
                profileImg: .profile4,
                name: "김가현",
                place: "광진구",
                message: "내말에답장해줘",
                itemImg: .img4
            ),
            ChatModel(
                profileImg: .profile5,
                name: "김가현",
                place: "광진구",
                message: "내말에답장해줘",
                itemImg: .img5
            ),
        ]
    }
}
