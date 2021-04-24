//
//  SpreadTableViewCell.swift
//  WannaChallenge
//
//  Created by luis.gustavo.jacinto on 23/04/21.
//

import UIKit

final class SpreadTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "SpreadTableViewCell"
    private let margin: CGFloat = 10
    
    // MARK: - View properties
    private var mainBackground: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    private lazy var footerView: FooterView = {
        let view = FooterView()
        return view
    }()
    
    private lazy var betterView: SpreadBetterView = {
        let view = SpreadBetterView()
        return view
    }()
    
    private lazy var takerView: SpreadBetterView = {
        let view = SpreadBetterView()
        return view
    }()
    
    private lazy var liveLabel: UILabel = {
        let label = UILabel()
        label.text = "• LIVE"
        label.textColor = Colors.customGreen
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "2nd | 01:02"
        return label
    }()
    
    private lazy var scoreboardLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "1 - 4"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        return label
    }()
    
    private lazy var versusView: VersusView = {
        let view = VersusView()
        return view
    }()
    
    // MARK - LayoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: margin,
                                                                     left: 0,
                                                                     bottom: margin,
                                                                     right: 0))
    }
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    func setupCell(with homeTeamName: String,
                   awayTeamName: String,
                   betterUsername: String,
                   takerUsername: String,
                   betterWins: String,
                   betterLosses: String,
                   takerWins: String,
                   takerLosses: String) {

        betterView.setupUserInfo(username: betterUsername, wins: betterWins, losses: betterLosses)
        takerView.setupUserInfo(username: takerUsername, wins: takerWins, losses: takerLosses)
        
        betterView.setupTeamName(homeTeamName)
        takerView.setupTeamName(awayTeamName)
        
        betterView.startFetchingTeamImage()
        betterView.startFetchingBetterImage()
        
        takerView.startFetchingTeamImage()
        takerView.startFetchingBetterImage()
    }
    
    func setupHomeTeamImage(_ image: UIImage) {
        betterView.finishFetchingTeamImage()
        betterView.setupTeamImage(image)
    }
    
    func setupBetterImage(_ image: UIImage) {
        betterView.finishFetchingBetterImage()
        betterView.setupBetterImage(image)
    }
    
    func setupAwayTeamImage(_ image: UIImage) {
        takerView.finishFetchingTeamImage()
        takerView.setupTeamImage(image)
    }
    
    func setupTakerImage(_ image: UIImage) {
        takerView.finishFetchingBetterImage()
        takerView.setupBetterImage(image)
    }
}

// MARK: - ViewCodable extension
extension SpreadTableViewCell: ViewCodable {
    func buildViewHierarchy() {
        contentView.addSubview(mainBackground)
        mainBackground.addSubview(footerView)
        mainBackground.addSubview(betterView)
        mainBackground.addSubview(takerView)
        mainBackground.addSubview(liveLabel)
        mainBackground.addSubview(scoreboardLabel)
        mainBackground.addSubview(timeLabel)
        mainBackground.addSubview(versusView)
    }
    
    func setupConstraints() {
        mainBackground.snp.makeConstraints { make in
            make.bottom.top.left.right.equalToSuperview()
        }
        
        scoreboardLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(betterView)
        }
        
        versusView.snp.makeConstraints { make in
            make.top.equalTo(scoreboardLabel.snp.bottom).offset(margin/2)
            make.left.equalTo(betterView.snp.right).offset(margin/2)
            make.right.equalTo(takerView.snp.left).offset(-margin/2)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.bottom.equalTo(scoreboardLabel.snp.top).offset(-margin/2)
            make.left.equalTo(betterView.snp.right)
            make.right.equalTo(takerView.snp.left)
        }
        
        betterView.snp.makeConstraints { make in
            make.right.equalTo(scoreboardLabel.snp.left)
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.top.equalToSuperview().offset(margin*4)
        }
        
        takerView.snp.makeConstraints { make in
            make.left.equalTo(scoreboardLabel.snp.right)
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.centerY.equalTo(betterView)
        }
        
        liveLabel.snp.makeConstraints { make in
            make.top.equalTo(betterView.snp.top)
            make.left.equalTo(betterView.snp.right)
            make.right.equalTo(takerView.snp.left)
        }
        
        footerView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.18)
        }
    }
    
    func setupAdditionalConfiguration() {
        contentView.bringSubviewToFront(mainBackground)
        mainBackground.backgroundColor = .white
        mainBackground.layer.cornerRadius = 30
        mainBackground.layer.masksToBounds = true
        
        // add shadow on cell
        backgroundColor = .clear
        layer.masksToBounds = false
        layer.shadowOpacity = 0.23
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.black.cgColor
    }
}
