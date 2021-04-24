//
//  BetterWithElipseView.swift
//  WannaChallenge
//
//  Created by luis.gustavo.jacinto on 23/04/21.
//

import UIKit

final class BetterWithElipseView: UIView {
    
    // MARK: - Properties
    private lazy var imageView: FetchableImageView = {
        let imageView = FetchableImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var ellipseView: EllipseView = {
        let view = EllipseView()
        return view
    }()
    
    private lazy var overUnderLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.textColor = Colors.customPurple
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "UNDER"
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
    
    // MARK: - Public methods
    func setupBetterImage(_ image: UIImage) {
        self.imageView.image = image
    }
    
    func startFetching() {
        self.imageView.state = .fetching
    }
    
    func finishFetching() {
        self.imageView.state = .fetched
    }
}

// MARK: - ViewCodable extension
extension BetterWithElipseView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(imageView)
        addSubview(ellipseView)
        ellipseView.addSubview(overUnderLabel)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
            make.width.equalTo(imageView.snp.height)
        }
        
        ellipseView.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        
        overUnderLabel.snp.makeConstraints { make in
            make.left.top.bottom.right.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        bringSubviewToFront(ellipseView)
    }
}
