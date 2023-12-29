//
//  ListCityController.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 25.12.2023.
//

import UIKit

final class ListCityController: UIViewController {
    
    //MARK: - Properties
    
    fileprivate var listCityView: ListCityView {
        guard let view = self.view as? ListCityView else {
            return ListCityView()
        }
        return view
    }
    
    private let listCity: [String] = ["Moscow", "Minsk", "Saint Petersburg", "London", "New York", "Cupertino"]
    
    private var listCityCell: [ModelNameCityCell] = []
    
    private var viewModel: ListCityViewModelProtocol
   
    //MARK: - life cycle
    
    override func loadView() {
        super.loadView()
        self.view = ListCityView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        listCityCell = map(with: listCity)
    }
    
    //MARK: - Init
    
    init(viewModel: ListCityViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    
    private func prepareTableView() {
        listCityView.tableView.delegate = self
        listCityView.tableView.dataSource = self
        listCityView.tableView.rowHeight = UITableView.automaticDimension
        listCityView.tableView.estimatedRowHeight = 44
    }
    
    private func map(with model: [String]) -> [ModelNameCityCell] {
        
        model.map { city in
            ModelNameCityCell(nameCity: city)
        }
    }
}
extension ListCityController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listCity.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NameCityCell.identifire, for: indexPath) as? NameCityCell else {
            return UITableViewCell()
        }
        cell.configure(with: listCityCell[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.selectedCity(with: listCityCell[indexPath.row].nameCity)
        viewModel.popToRoot()
    }
}

