//
//  OverUnderTableViewCell.swift
//  WannaChallenge
//
//  Created by luis.gustavo.jacinto on 22/04/21.
//

import UIKit

final class OverUnderTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "OverUnderTableViewCell"
    private let margin: CGFloat = 10
        
    // MARK: - View Properties
    private var mainBackground: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    private lazy var scheduledLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var betterView: OverUnderBetterView = {
        let view = OverUnderBetterView()
        return view
    }()
    
    private lazy var takerView: OverUnderBetterView = {
        let view = OverUnderBetterView()
        return view
    }()
    
    private lazy var homeTeam: TeamWithNameView = {
        let team = TeamWithNameView()
        return team
    }()
    
    private lazy var awayTeam: TeamWithNameView = {
        let team = TeamWithNameView()
        return team
    }()
    
    private lazy var versusView: VersusView = {
        let view = VersusView()
        return view
    }()
    
    private lazy var footerView: FooterView = {
        let view = FooterView()
        return view
    }()
    
    private lazy var padlockView: PadlockView = {
        let view = PadlockView()
        return view
    }()
    
    // MARK - LayoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: margin, left: 0, bottom: margin, right: 0))
    }
    
    func setupCell(with schedule: Date,
                   homeTeamName: String,
                   awayTeamName: String,
                   betterUsername: String,
                   takerUsername: String,
                   betterWins: String,
                   betterLosses: String,
                   takerWins: String,
                   takerLosses: String) {
        scheduledLabel.text = FullDateFormatter.fullDate(from: schedule)
        homeTeam.setupTeamName(homeTeamName)
        awayTeam.setupTeamName(awayTeamName)
        betterView.setupBetterUsername(betterUsername)
        takerView.setupBetterUsername(takerUsername)
        betterView.setupWinsAndLosses(wins: betterWins, losses: betterLosses)
        takerView.setupWinsAndLosses(wins: takerWins, losses: takerLosses)
        
        homeTeam.startFetching()
        awayTeam.startFetching()
        betterView.startFetching()
        takerView.startFetching()
    }
    
    func setupHomeTeamImage(_ image: UIImage) {
        homeTeam.setupTeamImage(image: image)
        homeTeam.finishFetching()
    }
    
    func setupAwayTeamImage(_ image: UIImage) {
        awayTeam.setupTeamImage(image: image)
        awayTeam.finishFetching()
    }
    
    func setupBetterImage(_ image: UIImage) {
        betterView.setupBetterImage(image)
        betterView.finishFetching()
    }
    
    func setupTakerImage(_ image: UIImage) {
        takerView.setupBetterImage(image)
        takerView.finishFetching()
    }
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewCodable extension
extension OverUnderTableViewCell: ViewCodable {
    func buildViewHierarchy() {
        contentView.addSubview(mainBackground)
        mainBackground.addSubview(scheduledLabel)
        mainBackground.addSubview(versusView)
        mainBackground.addSubview(homeTeam)
        mainBackground.addSubview(awayTeam)
        mainBackground.addSubview(footerView)
        mainBackground.addSubview(padlockView)
        mainBackground.addSubview(betterView)
        mainBackground.addSubview(takerView)
    }
    
    func setupConstraints() {
        mainBackground.snp.makeConstraints { make in
            make.bottom.top.left.right.equalToSuperview()
        }
        
        scheduledLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(margin)
            make.right.equalToSuperview().inset(margin)
        }
        
        homeTeam.snp.makeConstraints { make in
            make.top.equalTo(scheduledLabel.snp.bottom)
            make.right.equalTo(versusView.snp.left).offset(-20)
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        
        awayTeam.snp.makeConstraints { make in
            make.top.equalTo(scheduledLabel.snp.bottom)
            make.left.equalTo(versusView.snp.right).offset(20)
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        
        versusView.snp.makeConstraints { make in
            make.centerY.equalTo(homeTeam)
            make.height.equalTo(20)
            make.width.equalTo(75)
            make.centerX.equalToSuperview()
        }
        
        footerView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.18)
        }
        
        padlockView.snp.makeConstraints { make in
            make.bottom.equalTo(footerView.snp.top).offset(-margin*2)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.35)
            make.height.equalToSuperview().multipliedBy(0.35)
        }
        
        betterView.snp.makeConstraints { make in
            make.centerY.equalTo(padlockView.snp.centerY)
            make.height.equalToSuperview().multipliedBy(0.4)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.right.equalTo(padlockView.snp.left)
        }
        
        takerView.snp.makeConstraints { make in
            make.centerY.equalTo(padlockView.snp.centerY)
            make.height.equalToSuperview().multipliedBy(0.4)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.left.equalTo(padlockView.snp.right)
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
