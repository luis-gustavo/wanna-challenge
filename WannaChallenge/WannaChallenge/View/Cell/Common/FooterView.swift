//
//  FooterView.swift
//  WannaChallenge
//
//  Created by luis.gustavo.jacinto on 23/04/21.
//

import UIKit

final class FooterView: UIView {
    
    // MARK: - Properties\
    private let margin: CGFloat = 5
    private var buckImage: UIImage {
        guard let image = UIImage(named: "wanna-buck") else {
            preconditionFailure("Image named `wanna-buck` must exist")
        }
        return image
    }
    
    private lazy var betAmountLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.text = "500.00"
        label.font = UIFont.systemFont(ofSize: 28)
        return label
    }()
    
    private lazy var paysLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "PAYS: 500.50"
        label.baselineAdjustment = .alignBaselines
        return label
    }()
    
    private lazy var buckImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = buckImage
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var divisorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = Colors.customLightGray
        return view
    }()
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
}

// MARK: - ViewCodable extension
extension FooterView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(betAmountLabel)
        addSubview(paysLabel)
        addSubview(buckImageView)
        addSubview(divisorView)
    }
    
    func setupConstraints() {
        divisorView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(2)
        }
        
        betAmountLabel.snp.makeConstraints { make in
            make.top.equalTo(divisorView.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        buckImageView.snp.makeConstraints { make in
            make.right.equalTo(betAmountLabel.snp.left)
            make.centerY.equalTo(betAmountLabel)
        }
        
        paysLabel.snp.makeConstraints { make in
            make.top.equalTo(betAmountLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() { }
}
