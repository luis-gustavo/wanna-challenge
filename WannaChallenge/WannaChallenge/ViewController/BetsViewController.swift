//
//  BetsViewController.swift
//  WannaChallenge
//
//  Created by luis.gustavo.jacinto on 21/04/21.
//

import Networking
import UIKit

final class BetsViewController: UIViewController {
    
    // MARK: - Properties
    let betProvider: BetProviderProtocol
    let imageProvider: ImageProviderProtocol
    let betsView = BetsView()
    private var dataSource: BetTableViewDataSource?
    
    // MARK: - Inits
    init(betProvider: BetProviderProtocol,
         imageProvider: ImageProviderProtocol) {
        self.betProvider = betProvider
        self.imageProvider = imageProvider
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LoadView
    override func loadView() {
        view = betsView
    }
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        retrieveAllBets()
    }
}

// MARK: - Setup methods extension
private extension BetsViewController {
 
    func setup() {
        setupTableView()
    }
    
    func setupTableView() {
        betsView.tableView.register(OverUnderTableViewCell.self, forCellReuseIdentifier: OverUnderTableViewCell.identifier)
        betsView.tableView.register(SpreadTableViewCell.self, forCellReuseIdentifier: SpreadTableViewCell.identifier)
    }
}

// MARK: - Private methods extension
private extension BetsViewController {
    func retrieveAllBets() {
        betProvider.retrieveAllBets { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let bets):
                self.populateTableView(with: bets)
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func populateTableView(with bets: [Bet]) {
        let dataSource = BetTableViewDataSource(bets: bets, provider: imageProvider)
        self.dataSource = dataSource
        betsView.tableView.dataSource = dataSource
        betsView.tableView.delegate = dataSource
        betsView.tableView.reloadData()
    }
}
