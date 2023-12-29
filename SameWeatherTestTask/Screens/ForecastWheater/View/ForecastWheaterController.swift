//
//  ViewController.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 25.12.2023.
//

import UIKit
import RxSwift

final class ForecastWheaterController: UIViewController {
    
    //MARK: - Properties
    
    private var viewModel: ForecastWheaterViewModelProtocol
    
    private var disposeBag = DisposeBag()
    
    fileprivate var forecastWheaterView: ForecastWheaterView {
        guard let view = self.view as? ForecastWheaterView else {
            return ForecastWheaterView()
        }
        return view
    }
    
    private var model: [ModelForecastWheaterCell] = []
    
    private let estimatedRowHeight: CGFloat = 44
    
    //MARK: - life cycle
    
    override func loadView() {
        super.loadView()
        self.view = ForecastWheaterView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        prepareTableView()
        bind()
        viewModel.viewDidLoad()
    }
    
    // MARK: - MVVM
    
    private func bind() {
        viewModel.weather
            .observe(on: MainScheduler.instance)
            .subscribe { weatherModel in
                guard let weatherModel else { return }
                self.configure(model: weatherModel)
            }
            .disposed(by: disposeBag)
    }
    
    //MARK: - Init
    
    init(viewModel: ForecastWheaterViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    private func configureNavigationBar() {
        let lisButton = UIBarButtonItem(image: Images.list, landscapeImagePhone: Images.list, style: .done, target: self, action: #selector(listButton))
        let geoButton = UIBarButtonItem(image: Images.geo, landscapeImagePhone: Images.geo, style: .done, target: self, action: #selector(locationButton))
        setupNavigationBar(leftItem: geoButton, rightItem: lisButton, titleView: nil)
    }
    
    private func prepareTableView() {
        forecastWheaterView.tableView.delegate = self
        forecastWheaterView.tableView.dataSource = self
        forecastWheaterView.tableView.rowHeight = UITableView.automaticDimension
        forecastWheaterView.tableView.estimatedRowHeight = estimatedRowHeight
    }
    
    
    //MARK: - Action
    @objc func listButton() {
        viewModel.showListCities()
    }
    
    @objc func locationButton() {
        viewModel.getCurrentLocation()
    }
    
    //MARK: - Configure view
    
    func configure(model: DTOModelForecastWheater) {
        self.model = model.weathers
        let modelMain = ModelForecastWheater(temp: model.weathers.first?.temp ?? "0.0",
                                          image: model.weathers.first?.image ?? "",
                                          city: model.city)
        forecastWheaterView.configure(with: modelMain)
        forecastWheaterView.tableView.reloadData()
    }
}
extension ForecastWheaterController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ForecastWheaterCell.identifire, for: indexPath) as? ForecastWheaterCell else {
            return UITableViewCell()
        }
        
        if indexPath.row < model.count {
            cell.configure(with: model[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


