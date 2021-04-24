//
//  BetTableViewDataSource.swift
//  WannaChallenge
//
//  Created by luis.gustavo.jacinto on 22/04/21.
//

import Networking
import UIKit

final class BetTableViewDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    let bets: [Bet]
    let provider: ImageProviderProtocol
    private var placeholderImage: UIImage {
        guard let image = UIImage(named: "placeholder") else { preconditionFailure("placeholder image must exist") }
        return image
    }
    
    // MARK: - Inits
    init(bets: [Bet], provider: ImageProviderProtocol) {
        self.bets = bets
        self.provider = provider
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: OverUnderTableViewCell.identifier) else { return }
        cell.layer.masksToBounds = true
        let radius = cell.contentView.layer.cornerRadius
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: radius).cgPath
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bet = bets[indexPath.row]
        
        if bet.betType == .overUnder {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OverUnderTableViewCell.identifier, for: indexPath) as? OverUnderTableViewCell else { return UITableViewCell() }
            
            cell.setupCell(with: bet.event.scheduled,
                           homeTeamName: bet.homeTeam.name,
                           awayTeamName: bet.awayTeam.name,
                           betterUsername: bet.better.username,
                           takerUsername: bet.taker.username,
                           betterWins: bet.better.wins.description,
                           betterLosses: bet.better.losses.description,
                           takerWins: bet.taker.wins.description,
                           takerLosses: bet.taker.losses.description)
            
            // Fetch home team image
            provider.retrieveImage(from: bet.homeTeam.logo,
                                   returnOnQueue: .main) { [weak self, weak cell] (result) in
                switch result {
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    guard let self = self else { return }
                    cell?.setupHomeTeamImage(self.placeholderImage)
                case .success(let image): cell?.setupHomeTeamImage(image)
                }
            }
            
            // Fetch away team image
            provider.retrieveImage(from: bet.awayTeam.logo,
                                   returnOnQueue: .main) { [weak self, weak cell] (result) in
                switch result {
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    guard let self = self else { return }
                    cell?.setupAwayTeamImage(self.placeholderImage)
                case .success(let image): cell?.setupAwayTeamImage(image)
                }
            }
            
            // Fetch better user image
            provider.retrieveImage(from: bet.better.image,
                                   returnOnQueue: .main) { [weak self, weak cell] (result) in
                switch result {
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    guard let self = self else { return }
                    cell?.setupBetterImage(self.placeholderImage)
                case .success(let image): cell?.setupBetterImage(image)
                }
            }
            
            // Fetch taker user image
            provider.retrieveImage(from: bet.taker.image,
                                   returnOnQueue: .main) { [weak self, weak cell] (result) in
                switch result {
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    guard let self = self else { return }
                    cell?.setupTakerImage(self.placeholderImage)
                case .success(let image): cell?.setupTakerImage(image)
                }
            }
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SpreadTableViewCell.identifier, for: indexPath) as? SpreadTableViewCell else { return UITableViewCell() }
            
            cell.setupCell(with: bet.homeTeam.name,
                           awayTeamName: bet.awayTeam.name,
                           betterUsername: bet.better.username,
                           takerUsername: bet.taker.username,
                           betterWins: bet.better.wins.description,
                           betterLosses: bet.better.losses.description,
                           takerWins: bet.taker.wins.description,
                           takerLosses: bet.taker.losses.description)
            
            // Fetch home team image
            provider.retrieveImage(from: bet.homeTeam.logo,
                                   returnOnQueue: .main) { [weak self, weak cell] (result) in
                switch result {
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    guard let self = self else { return }
                    cell?.setupHomeTeamImage(self.placeholderImage)
                case .success(let image): cell?.setupHomeTeamImage(image)
                }
            }
            
            // Fetch away team image
            provider.retrieveImage(from: bet.awayTeam.logo,
                                   returnOnQueue: .main) { [weak self, weak cell] (result) in
                switch result {
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    guard let self = self else { return }
                    cell?.setupAwayTeamImage(self.placeholderImage)
                case .success(let image): cell?.setupAwayTeamImage(image)
                }
            }
            
            // Fetch better user image
            provider.retrieveImage(from: bet.better.image,
                                   returnOnQueue: .main) { [weak self, weak cell] (result) in
                switch result {
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    guard let self = self else { return }
                    cell?.setupBetterImage(self.placeholderImage)
                case .success(let image): cell?.setupBetterImage(image)
                }
            }
            
            // Fetch taker user image
            provider.retrieveImage(from: bet.taker.image,
                                   returnOnQueue: .main) { [weak self, weak cell] (result) in
                switch result {
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    guard let self = self else { return }
                    cell?.setupTakerImage(self.placeholderImage)
                case .success(let image): cell?.setupTakerImage(image)
                }
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.size.height * 0.45
    }
    
}
