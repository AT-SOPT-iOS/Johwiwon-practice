//
//  ChatViewController.swift
//  practice
//
//  Created by 조휘원 on 4/26/25.
//

import SnapKit
import Then
import UIKit

/*
 1단계 테이블뷰 만들고 레이아웃 설정
 2단계 Cell 만들기
 3단계 뷰컨에서 모델 불러오기
 3-2단계 뷰컨 테이블뷰에서 어떤 cell을 써야할지 지정 등록
 4단계 뷰컨 모델이랑 Cell을 바인딩 시키기
 */

class ChatViewController: UIViewController {
    private let tableView = UITableView(frame: .zero, style: .plain)
    private let chatList = ChatModel.dummy()

    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func register() {
        tableView.register(
            ChatTableViewCell.self,
            forCellReuseIdentifier: ChatTableViewCell.identifier
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setLayout()
        register()
        setDelegate()
    }

    private func setLayout() {  // 3번
        self.view.addSubview(tableView)

        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }

}

extension ChatViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 72
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        return chatList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ChatTableViewCell.identifier,
                for: indexPath
            ) as? ChatTableViewCell
        else { return UITableViewCell() }
        cell.dataBind(chatList[indexPath.row])
        return cell
    }
}
