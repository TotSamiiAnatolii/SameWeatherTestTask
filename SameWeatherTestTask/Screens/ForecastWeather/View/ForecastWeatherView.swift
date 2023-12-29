//
//  ForecastWheaterView.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 25.12.2023.
//

import UIKit
import SnapKit
import Kingfisher

final class ForecastWeatherView: UIView {
    
    //MARK: - Properties
    
    public var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.register(ForecastWeatherCell.self, forCellReuseIdentifier: ForecastWeatherCell.identifire)
        return tableView
    }()
    
    private let cityLabel: UILabel = UILabel()
        .setMyStyle(numberOfLines: 1,
                    textAlignment: .center,
                    font: Fonts.mainTemperature)
        .setTextColor(color: .black)
    
    private let mainTemperatureLabel: UILabel = UILabel()
        .setMyStyle(numberOfLines: 1,
                    textAlignment: .center,
                    font: Fonts.mainTemperature)
        .setTextColor(color: .black)
    
    private let typeWeatherImage: UIImageView = UIImageView()
        .setMyStyle()
    
    private let mainStack = UIStackView()
        .myStyleStack(spacing: 10,
                      alignment: .center,
                      axis: .vertical,
                      distribution: .equalSpacing,
                      userInteraction: false)
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareView()
        setViewHierarhies()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    
    private func setViewHierarhies() {
        mainStack.addArrangedSubview(cityLabel)
        mainStack.addArrangedSubview(mainTemperatureLabel)
        mainStack.addArrangedSubview(typeWeatherImage)
        addSubview(mainStack)
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        
        typeWeatherImage.snp.makeConstraints { make in
            make.width.height.equalTo(frame.width * 0.2)
        }
        
        mainStack.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(AppDesign.inset)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(mainStack.snp.bottom).offset(AppDesign.offset)
            make.left.right.bottom.equalToSuperview().inset(AppDesign.inset)
        }
    }
    
    private func prepareView() {
        backgroundColor = .white
    }
}
extension ForecastWeatherView: ConfigurableView {
    
    func configure(with model: ModelForecastWeather) {
        cityLabel.text = model.city
        mainTemperatureLabel.text = "\(model.temp)º"
        typeWeatherImage.kf.setImage(with: APIBuilder.fetchWeatherImage(for: model.image))
    }
    
    typealias Model = ModelForecastWeather
}
