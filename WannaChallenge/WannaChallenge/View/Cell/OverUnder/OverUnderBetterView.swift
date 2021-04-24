//
//  OverUnderBetterView.swift
//  WannaChallenge
//
//  Created by luis.gustavo.jacinto on 23/04/21.
//

import UIKit

final class OverUnderBetterView: UIView {
    
    // MARK: - Properties
    private lazy var userInfoView: UserInfoView = {
        let view = UserInfoView()
        return view
    }()
    
    private lazy var betterWithEllipseView: BetterWithElipseView = {
        let view = BetterWithElipseView()
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
    func setupBetterUsername(_ username: String) {
        userInfoView.setupBetterUsername(username)
    }
    
    func setupBetterImage(_ image: UIImage) {
        self.betterWithEllipseView.setupBetterImage(image)
    }
    
    func setupWinsAndLosses(wins: String, losses: String) {
        userInfoView.setupWinsAndLosses(wins: wins, losses: losses)
    }
    
    func startFetching() {
        self.betterWithEllipseView.startFetching()
    }
    
    func finishFetching() {
        self.betterWithEllipseView.finishFetching()
    }
}

// MARK: - ViewCodable extension
extension OverUnderBetterView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(betterWithEllipseView)
        addSubview(userInfoView)
    }
    
    func setupConstraints() {
        userInfoView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.27)
        }
        
        betterWithEllipseView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.top.equalTo(userInfoView.snp.bottom)
        }
    }
    
    func setupAdditionalConfiguration() { }
}
