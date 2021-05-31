//
//  ViewController.swift
//  sandbox-products
//
//  Created by Hildequias Silas dos Santos Junior on 11/11/20.
//

import UIKit
import SkeletonView

// MARK: - Enums
enum Row: Int {
    case spotlight = 0
    case cash
    case product
}

class BaseViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properies
    private let viewModel = SandboxViewModel()
    private var sections: [Row] {
        return [.spotlight, .cash, .product]
    }
    
    let spotlightIdentifier = "spotlightCell"
    let cashIdentifier = "cashCell"
    let productIdentifier = "productCell"
    
    // MARK: - Cycle View
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel.delegate = self
        registerTableViewCells()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.loadSandboxData()
    }
    
    // MARK: - Methods
    private func registerTableViewCells() {
        let spotlightCell = UINib(nibName: "SpotlightViewCell", bundle: nil)
        tableView.register(spotlightCell, forCellReuseIdentifier: spotlightIdentifier)
        
        let cashCell = UINib(nibName: "CashViewCell", bundle: nil)
        tableView.register(cashCell, forCellReuseIdentifier: cashIdentifier)
        
        let productCell = UINib(nibName: "ProductViewCell", bundle: nil)
        tableView.register(productCell, forCellReuseIdentifier: productIdentifier)
    }
}

// MARK: - Extension SandboxViewModelDelegate
extension BaseViewController: SandboxViewModelDelegate {
    func updateData() {
        tableView.reloadData()
    }
}

// MARK: - Extension UITableViewDelegate
extension BaseViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let frame = CGRect(x: 16, y: 0, width: view.bounds.width, height: 42)
        let headerView = UIView(frame: frame)
        let userName = UILabel(frame: frame)
        userName.text = "Olá, Maria"
        userName.textColor = UIColor(named: .mediumDarkGray)
        userName.font = UIFont.boldSystemFont(ofSize: 18.0)
        headerView.addSubview(userName)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch sections[indexPath.item] {
        case .spotlight, .product:
            return 200
        case .cash:
            return 170
        }
    }
}

// MARK: - Extension UITableViewDataSource
extension BaseViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard viewModel.sandboxData != nil else {
            let cell = UITableViewCell()
            cell.showAnimatedGradientSkeleton()
            return cell
        }
        
        switch sections[indexPath.item] {
        
        case .spotlight:
            let spotlights = viewModel.sandboxData.spotlight
            let cell = tableView.dequeueReusableCell(withIdentifier: spotlightIdentifier, for: indexPath) as! SpotlightViewCell
            cell.setup(spotlights: spotlights)
            cell.hideSkeleton()
            return cell
            
        case .cash:
            let cash = viewModel.sandboxData.cash
            let cell = tableView.dequeueReusableCell(withIdentifier: cashIdentifier, for: indexPath) as! CashViewCell
            cell.setup(cash)
            cell.hideSkeleton()
            return cell
            
        case .product:
            let products = viewModel.sandboxData.products
            let cell = tableView.dequeueReusableCell(withIdentifier: productIdentifier, for: indexPath) as! ProductViewCell
            cell.setup(products)
            cell.hideSkeleton()
            return cell
        }
    }
}
