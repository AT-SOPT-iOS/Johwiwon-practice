//
//  GoViewController.swift
//  practice
//
//  Created by 조휘원 on 4/12/25.
//

import UIKit

class ScrollViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private func setLayout(){
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        greenView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(greenView)
        contentView.addSubview(blueView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
            
        ])
        
        let heightConstraint = contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor)
        heightConstraint.priority = .defaultLow
        heightConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: contentView.topAnchor),
            greenView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            greenView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            blueView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
            blueView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            blueView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            blueView.heightAnchor.constraint(equalToConstant: 1000),
            blueView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    var yellow : UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    var greenView : UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    var black : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    var blueView : UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    var red : UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    var orange : UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    var purple : UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()
    
    
}
