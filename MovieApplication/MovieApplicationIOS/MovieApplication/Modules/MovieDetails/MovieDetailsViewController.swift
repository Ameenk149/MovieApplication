//
//  MovieDetailsViewController.swift
//  iosMovieApplication
//
//  Created by Ameen on 07.01.22.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    private var viewModel: MovieDetailsViewModelProtocol
    @IBOutlet weak var movieDetailsTableView: UITableView!
    
    init?(viewModel : MovieDetailsViewModelProtocol, coder: NSCoder) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindings()
        registerXibs()
    }
    
    private func bindings() {
        viewModel.success = { [weak self] in
            DispatchQueue.main.async {
                self?.movieDetailsTableView.reloadData()
            }
         }
        viewModel.failure = { error in
            print(error)
        }
    }
    
    func registerXibs() {
        movieDetailsTableView.register(UINib(nibName: Constants.Views.Xibs.headerMovieDetailsTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.Views.Xibs.headerMovieDetailsTableViewCell)
        movieDetailsTableView.register(UINib(nibName: Constants.Views.Xibs.releaseDateMovieDetailsTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.Views.Xibs.releaseDateMovieDetailsTableViewCell)
        movieDetailsTableView.register(UINib(nibName: Constants.Views.Xibs.overviewMovieDetailsTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.Views.Xibs.overviewMovieDetailsTableViewCell)
    }
    
}

extension MovieDetailsViewController {
    static func create(with movie: Movie) -> UIViewController? {
        let apiService: ApiService = DefaultNetworkService()
        let viewModel = MovieDetailsDefaultViewModel(apiService: apiService, movie: movie)
        guard let movieId = movie.id else {
            return nil
        }
        viewModel.getDetails(movieId: movieId)
        
        let storyboard = UIStoryboard(name: Constants.Views.Storyboards.storyboard, bundle: nil)
        
        let viewController = storyboard.instantiateViewController(identifier: Constants.Views.ViewControllers.movieDetailsViewController, creator: { coder -> MovieDetailsViewController in
            MovieDetailsViewController(viewModel: viewModel, coder: coder)!
        })
        return viewController
    }
}

extension MovieDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = viewModel.movieDetailsViewModel
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Views.Xibs.headerMovieDetailsTableViewCell, for: indexPath) as! MovieDetailsHeaderViewCell
            cell.populateCell(data: data)
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Views.Xibs.releaseDateMovieDetailsTableViewCell, for: indexPath) as! ReleaseDateTableViewCell
            
            cell.populate(data: data)
            return cell
            
        default:
            let cell =  tableView.dequeueReusableCell(withIdentifier: Constants.Views.Xibs.overviewMovieDetailsTableViewCell, for: indexPath) as! OverviewTableViewCell
            
            cell.populate(data: data)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0: return 387
        case 1: return 82
        default: return 135
        }
    }
    
    
    
}


