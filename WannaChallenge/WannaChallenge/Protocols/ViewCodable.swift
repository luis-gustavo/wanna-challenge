//
//  ViewCodable.swift
//  WannaChallenge
//
//  Created by luis.gustavo.jacinto on 21/04/21.
//

protocol ViewCodable {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension ViewCodable {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
