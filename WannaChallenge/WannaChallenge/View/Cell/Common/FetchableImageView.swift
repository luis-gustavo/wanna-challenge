//
//  FetchableImageView.swift
//  WannaChallenge
//
//  Created by luis.gustavo.jacinto on 22/04/21.
//

import UIKit

enum FetchState {
    case fetching
    case fetched
}

protocol Fetchable {
    func change(to state: FetchState)
    var state: FetchState { get set }
    var activityIndicator: UIActivityIndicatorView { get set }
    func showActivityIndicator()
    func hideActivityIndicator()
}

final class FetchableImageView: UIImageView, Fetchable {
    
    // MARK: - Properties
    var state: FetchState = .fetching {
        didSet {
            change(to: state)
        }
    }
    
    var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        return activityIndicator
    }()
    
    // MARK: - LayoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius = frame.width / 2
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods Extension
    func change(to state: FetchState) {
        switch state {
        case .fetching: showActivityIndicator()
        case .fetched: hideActivityIndicator()
        }
    }
    
    func showActivityIndicator() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
}

// MARK: - ViewCodable extension
extension FetchableImageView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(activityIndicator)
    }
    
    func setupConstraints() {
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() { }
}
