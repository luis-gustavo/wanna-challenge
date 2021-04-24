//
//  PadlockView.swift
//  WannaChallenge
//
//  Created by luis.gustavo.jacinto on 23/04/21.
//

import UIKit

final class PadlockView: UIView {
    
    // MARK: - Properties
    private var padlockImage: UIImage {
        guard let image = UIImage(named: "padlock") else {
            preconditionFailure("Padlock image must exist")
        }
        return image
    }
    
    private lazy var padlockImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = padlockImage
        return imageView
    }()
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.textColor = Colors.customPurple
        label.font = UIFont.systemFont(ofSize: 32)
        label.text = "24.5"
        return label
    }()
    
    private lazy var totalGoalsLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.textColor = .gray
        label.text = "TOTAL GOALS"
        return label
    }()
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewCodable extension
extension PadlockView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(padlockImageView)
        addSubview(scoreLabel)
        addSubview(totalGoalsLabel)
    }
    
    func setupConstraints() {
        padlockImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        scoreLabel.snp.makeConstraints { make in
            make.center.equalTo(padlockImageView)
            make.left.right.equalToSuperview()
        }
        
        totalGoalsLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(padlockImageView.snp.bottom)
        }
    }
    
    func setupAdditionalConfiguration() {
        
    }
}
