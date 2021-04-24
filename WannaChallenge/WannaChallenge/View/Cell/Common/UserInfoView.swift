//
//  UserInfoView.swift
//  WannaChallenge
//
//  Created by luis.gustavo.jacinto on 24/04/21.
//

import UIKit

final class UserInfoView: UIView {
    
    // MARK: - Properties
    private lazy var betterUsernameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var winsLossesLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        return stackView
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
        self.betterUsernameLabel.text = username
    }
    
    func setupWinsAndLosses(wins: String, losses: String) {
        self.winsLossesLabel.text = "(\(wins)-\(losses))"
    }
}

// MARK: - ViewCodable extension
extension UserInfoView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(betterUsernameLabel)
        stackView.addArrangedSubview(winsLossesLabel)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() { }
}
