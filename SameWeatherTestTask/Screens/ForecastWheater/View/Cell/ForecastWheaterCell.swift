//
//  ForecastWheaterCell.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 25.12.2023.
//

import UIKit
import Kingfisher

final class ForecastWheaterCell: UITableViewCell {

    //MARK: - Properties
    
    static var identifire: String {"\(Self.self)"}
    
    private let dayLabel: UILabel = UILabel()
        .setMyStyle(numberOfLines: 1,
                    textAlignment: .left,
                    font: Fonts.weatherForNextDays)
        .setTextColor(color: .black)
    
    private let temperatureLabel: UILabel = UILabel()
        .setMyStyle(numberOfLines: 1,
                    textAlignment: .left,
                    font: Fonts.weatherForNextDays)
        .setTextColor(color: .black)
    
    private let typeWeatherImage: UIImageView = UIImageView()
        .setMyStyle()
        
    private let mainStack = UIStackView()
        .myStyleStack(spacing: 15,
                      alignment: .fill,
                      axis: .horizontal,
                      distribution: .fill,
                      userInteraction: false)
    
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
        mainStack.addArrangedSubview(dayLabel)
        mainStack.addArrangedSubview(temperatureLabel)
        mainStack.addArrangedSubview(typeWeatherImage)
        contentView.addSubview(mainStack)
    }
    
    private func setupConstraints() {
        dayLabel.snp.makeConstraints { make in
            make.width.equalTo(AppDesign.widthDayLabel(frame.width))
        }
        
        typeWeatherImage.snp.makeConstraints { make in
            make.width.height.equalTo(AppDesign.typeWeatherImageHeight)
        }
        
        mainStack.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(AppDesign.offset)
            make.top.bottom.equalToSuperview()
        }
    }
}
extension ForecastWheaterCell: ConfigurableView {
    
    func configure(with model: ModelForecastWheaterCell) {
        dayLabel.text = DateFormatter().getWeekDay(date: model.date)
        temperatureLabel.text = "\(model.temp)º"
        typeWeatherImage.kf.setImage(with: APIBuilder.fetchWeatherImage(for: model.image))
    }
    
    typealias Model = ModelForecastWheaterCell
}

