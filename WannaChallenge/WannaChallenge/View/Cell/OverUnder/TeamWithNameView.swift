//
//  TeamWithNameView.swift
//  WannaChallenge
//
//  Created by luis.gustavo.jacinto on 22/04/21.
//

import UIKit

final class TeamWithNameView: UIView {
    
    // MARK: - Properties
    private lazy var imageView: FetchableImageView = {
        let image = FetchableImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var teamNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
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
    
    // MARK: - Public methods extension
    func setupTeamName(_ name: String) {
        self.teamNameLabel.text = name
    }
    
    func setupTeamImage(image: UIImage) {
        self.imageView.image = image
    }
    
    func startFetching() {
        imageView.state = .fetching
    }
    
    func finishFetching() {
        imageView.state = .fetched
    }
}

// MARK: - ViewCodable extension
extension TeamWithNameView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(imageView)
        addSubview(teamNameLabel)
    }

    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.centerX.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.65)
            make.width.equalTo(imageView.snp.height)
        }
        
        teamNameLabel.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom)
        }
    }

    func setupAdditionalConfiguration() { }
}
