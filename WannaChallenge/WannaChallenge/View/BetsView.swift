//
//  BetsView.swift
//  WannaChallenge
//
//  Created by luis.gustavo.jacinto on 21/04/21.
//

import SnapKit
import UIKit

final class BetsView: UIView {
    
    // MARK: - Properties
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.separatorColor = .clear
        tableView.backgroundColor = .lightGray
        return tableView
    }()
    
    private let margin: CGFloat = 10
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewCodableExtension
extension BetsView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(margin)
            make.bottom.right.equalToSuperview().inset(margin)
        }
    }
    
    func setupAdditionalConfiguration() {
        tableView.backgroundColor = Colors.customLightGray
        backgroundColor = Colors.customLightGray
    }
}
