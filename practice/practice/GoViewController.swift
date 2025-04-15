//
//  GoViewController.swift
//  practice
//
//  Created by 조휘원 on 4/12/25.
//

import UIKit

class GoViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setLayout()
    }
    
    var widthSize = UIScreen.main.bounds.width/2
    var heightSize = UIScreen.main.bounds.height/4
    
    private func setLayout(){
        [yellow, green, black, blue,].forEach {
            self.view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([yellow.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
                                     yellow.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 0),
                                     yellow.widthAnchor.constraint(equalToConstant: widthSize),
                                     yellow.heightAnchor.constraint(equalToConstant: heightSize)])
        NSLayoutConstraint.activate([green.topAnchor.constraint(equalTo: yellow.bottomAnchor,),
                                     green.leadingAnchor.constraint(equalTo: yellow.trailingAnchor),
                                     green.widthAnchor.constraint(equalToConstant: widthSize),
                                     green.heightAnchor.constraint(equalToConstant: heightSize)])
        NSLayoutConstraint.activate([black.topAnchor.constraint(equalTo: green.bottomAnchor,),
                                     black.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 0),
                                     black.widthAnchor.constraint(equalToConstant: widthSize),
                                     black.heightAnchor.constraint(equalToConstant: heightSize)])
        NSLayoutConstraint.activate([blue.topAnchor.constraint(equalTo: black.bottomAnchor,),
                                     blue.leadingAnchor.constraint(equalTo: black.trailingAnchor),
                                     blue.widthAnchor.constraint(equalToConstant: widthSize),
                                     blue.heightAnchor.constraint(equalToConstant: heightSize)])
        
    }
    
    var yellow : UIView = {
        let view = UIView(
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
    var green : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    
    var black : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    var blue : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    
}
