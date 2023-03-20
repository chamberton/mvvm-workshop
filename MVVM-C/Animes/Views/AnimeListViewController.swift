//
//  AnimeListViewController.swift
//  MVVM-C-Example
//
//  Created by Serge Mbamba on 2023/03/20.
//

import UIKit
import os.log
import Combine

class AnimeListViewController: UIViewController, View, StoryboardViewController {
    static let storyboardIdentifier: String = "AnimeListViewController"
    
    private lazy var logger = Logger(subsystem: "AnimeListViewController", category: "View")
    
    // MARK: - IBOutlets
    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak private var tableView : UITableView!
    @IBOutlet weak private var emptyStateView : UIView!
    
    var viewModel : AnimeListViewModel!
    private var stateSubsriptions : [AnyCancellable] = []
    
    // MARK: - View cycle method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bindToViewModel()
    }
    
    // MARK: - View setup and configuration
    
    private func setup() {
        title = "Animes"
        configureTitleAsLarge()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func bindToViewModel() {
        guard viewModel != nil else {
            logger.error( "Cannot bind to missing view model, did you forget to get the view model")
            return
        }
        let cancellable = viewModel.$state.receive(on: DispatchQueue.main).sink { [weak self] state in
            self?.render(state)
        }
        stateSubsriptions.append(cancellable)
    }
    
    
    @MainActor private func render(_ state: AnimeListViewModel.State) {
        switch state {
        case .loading:
            activityIndicator.startAnimating()
        case .loaded(let animees):
            activityIndicator.stopAnimating()
            renderLoadedState(isEmpty: animees.isEmpty)
        case .failed(let message):
            activityIndicator.stopAnimating()
            renderFailure(reason: message, retryHandler: ("Retry", {[weak self] in
                self?.viewModel.fetchAnimes()
            }))
            
        }
    }
    
    private func renderLoadedState(isEmpty: Bool) {
        tableView.isHidden = isEmpty
        emptyStateView.isHidden = !isEmpty
        if !isEmpty {
            tableView.reloadData()
        }
    }
    
    deinit {
        stateSubsriptions.removeAll()
    }
    
}

// MARK: - UITableViewDelegate and UITableViewDataSource

extension AnimeListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.animes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return  UITableViewCell()
        }
        cell.textLabel?.text = viewModel.nameOfAnime(at: indexPath.row)
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .gray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.showDetailsOfAnime(at: indexPath.row)
    }
}
