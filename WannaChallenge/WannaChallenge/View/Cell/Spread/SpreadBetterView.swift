//
//  SpreadBetterView.swift
//  WannaChallenge
//
//  Created by luis.gustavo.jacinto on 24/04/21.
//

import UIKit

final class SpreadBetterView: UIView {
    
    // MARK: - Properties
    private lazy var userInfoView: UserInfoView = {
        let view = UserInfoView()
        return view
    }()
    
    private lazy var teamNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var teamWithEllipse: TeamWithEllipseView = {
        let view = TeamWithEllipseView()
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
    func setupUserInfo(username: String, wins: String, losses: String) {
        userInfoView.setupBetterUsername(username)
        userInfoView.setupWinsAndLosses(wins: wins, losses: losses)
    }
    
    func setupTeamName(_ name: String) {
        teamNameLabel.text = name
    }
    
    func setupTeamImage(_ image: UIImage) {
        teamWithEllipse.setupTeamImage(image)
    }
    
    func setupBetterImage(_ image: UIImage) {
        teamWithEllipse.setupBetterImage(image)
    }
    
    func startFetchingTeamImage() {
        teamWithEllipse.startFetchingTeamImage()
    }
    
    func finishFetchingTeamImage() {
        teamWithEllipse.finishFetchingTeamImage()
    }
    
    func startFetchingBetterImage() {
        teamWithEllipse.startFetchingBetterImage()
    }
    
    func finishFetchingBetterImage() {
        teamWithEllipse.finishFetchingBetterImage()
    }
}

// MARK: - ViewCodable extension
extension SpreadBetterView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(userInfoView)
        addSubview(teamWithEllipse)
        addSubview(teamNameLabel)
    }
    
    func setupConstraints() {
        userInfoView.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.25)
        }
        
        teamNameLabel.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(teamWithEllipse.snp.bottom)
        }
        
        teamWithEllipse.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(userInfoView.snp.bottom)
            make.bottom.equalTo(teamNameLabel.snp.top)
        }
    }
    
    func setupAdditionalConfiguration() { }
}
