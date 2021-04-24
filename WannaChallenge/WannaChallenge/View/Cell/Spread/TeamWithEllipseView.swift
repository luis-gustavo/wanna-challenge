//
//  TeamWithEllipseView.swift
//  WannaChallenge
//
//  Created by luis.gustavo.jacinto on 23/04/21.
//

import UIKit

final class TeamWithEllipseView: UIView {
    
    // MARK: - Properties
    private lazy var betterImageView: FetchableImageView = {
        let imageView = FetchableImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var teamImageView: FetchableImageView = {
        let imageView = FetchableImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var ellipseView: EllipseView = {
        let view = EllipseView()
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
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
    func setupTeamImage(_ image: UIImage) {
        teamImageView.image = image
    }
    
    func setupBetterImage(_ image: UIImage) {
        betterImageView.image = image
    }
    
    func startFetchingTeamImage() {
        teamImageView.state = .fetching
    }
    
    func finishFetchingTeamImage() {
        teamImageView.state = .fetched
    }
    
    func startFetchingBetterImage() {
        betterImageView.state = .fetching
    }
    
    func finishFetchingBetterImage() {
        betterImageView.state = .fetched
    }
}

// MARK: - ViewCodable extension
extension TeamWithEllipseView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(betterImageView)
        addSubview(ellipseView)
        ellipseView.addSubview(stackView)
        stackView.addArrangedSubview(teamImageView)
    }
    
    func setupConstraints() {
        betterImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.6)
            make.width.equalTo(betterImageView.snp.height)
        }
        
        ellipseView.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.44)
        }
        
        stackView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() { }
}
