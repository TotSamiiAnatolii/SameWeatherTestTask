//
//  NameCityCell.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 25.12.2023.
//

import UIKit

final class NameCityCell: UITableViewCell {
    
    //MARK: - Properties
    
    static var identifire: String { "\(Self.self)" }
    
    private let nameCityLabel: UILabel = UILabel()
        .setMyStyle(numberOfLines: 1,
                    textAlignment: .left,
                    font: Fonts.nameCity)
        .setTextColor(color: .black)
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViewHierarhies()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    
    private func setViewHierarhies() {
        contentView.addSubview(nameCityLabel)
    }
    
    private func setupConstraints() {
        
        nameCityLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(AppDesign.offset)
        }
    }
}
extension NameCityCell: ConfigurableView {
    func configure(with model: ModelNameCityCell) {
        nameCityLabel.text = model.nameCity
    }
    
    typealias Model = ModelNameCityCell
}
