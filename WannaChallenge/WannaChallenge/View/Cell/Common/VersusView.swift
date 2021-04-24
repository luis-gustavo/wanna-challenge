//
//  VersusView.swift
//  WannaChallenge
//
//  Created by luis.gustavo.jacinto on 22/04/21.
//

import UIKit

final class VersusView: UIView {
    
    // MARK: - Properties
    private let margin: CGFloat = 20
    
    private lazy var leftDash: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = Colors.customLightGray
        return view
    }()
    
    private lazy var versusLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "vs"
        label.textAlignment = .center
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var rightDash: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = Colors.customLightGray
        return view
    }()
    
    // MARK: - Inits
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewCodable extension
extension VersusView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(versusLabel)
        addSubview(leftDash)
        addSubview(rightDash)
    }
    
    func setupConstraints() {
        
        versusLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(40)
        }
        
        leftDash.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.height.equalTo(2)
            make.right.equalTo(versusLabel.safeAreaLayoutGuide.snp.left)
            make.centerY.equalTo(versusLabel)
        }
        
        rightDash.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.height.equalTo(2)
            make.left.equalTo(versusLabel.snp.right)
            make.centerY.equalTo(versusLabel)
        }
        
    }
    
    func setupAdditionalConfiguration() { }
}
