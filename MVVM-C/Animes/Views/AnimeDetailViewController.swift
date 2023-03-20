//
//  AnimeListViewController.swift
//  MVVM-C-Example
//
//  Created by Serge Mbamba on 2023/03/20.
//


import UIKit
import Combine
import os.log

class AnimeDetailViewController: UIViewController, StoryboardViewController {
    static let storyboardIdentifier: String = "AnimeDetailViewController"
    private lazy var logger = Logger(subsystem: "AnimeListViewController", category: "View")
    
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var descriptionTextView: UITextView!
    
    var viewModel : AnimeDetailViewModel!
    private var stateSubsriptions : [AnyCancellable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToViewModel()
    }
    
    // MARK: - View setup and configuration
    
    private func setup() {
        title = "Animes"
        configureTitleAsLarge()
    }
    
    private func bindToViewModel() {
        guard viewModel != nil else {
            logger.error( "Cannot bind to missing view model, did you forget to get the view model")
            return
        }
        let cancellable = viewModel.$anime.receive(on: DispatchQueue.main).sink { [weak self] anime in
            self?.render(from: anime)
        }
        stateSubsriptions.append(cancellable)
    }
    
    @MainActor private func render(from anime: AnimeModel) {
        title = anime.name
        imageView.image =  UIImage(named: anime.image)
        descriptionTextView.text = anime.description
    }

}
