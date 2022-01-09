//
//  ViewController.swift
//  iosMovieApplication
//
//  Created by Ameen on 03.01.22.
//

import UIKit

//change the name of viewController
class TrendingMoviesViewController: UIViewController {

    private var viewModel: TrendingMoviesViewModelProtocol
   
    @IBOutlet weak var trendingMovies_collectionView: UICollectionView!
    
    init?(viewModel : TrendingMoviesViewModelProtocol, coder: NSCoder) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDelegates()
        registerXibs()
        getMoviesFromApi()
        bindings()
    }
    
    func getMoviesFromApi(){
        viewModel.getMovies()
    }
    
    private func goToDetails(with data: Movie) {
      
       guard let movieDetailViewController = MovieDetailsViewController.create(with: data) else { return }
        navigationController?.pushViewController(movieDetailViewController, animated: true)
        
    }
    
    private func bindings() {
        viewModel.success = { [weak self] in
            DispatchQueue.main.async {
                self?.trendingMovies_collectionView.reloadData()
            }
        }
        viewModel.failure = { error in
            print(error)
        }
        viewModel.moveToDetails = { [weak self] data in
            self?.goToDetails(with: data)
        }
    }
  
    func initDelegates() {
        trendingMovies_collectionView.delegate = self
        trendingMovies_collectionView.dataSource = self
    }
    
    func registerXibs() {
        trendingMovies_collectionView.register(UINib(nibName: Constants.Views.Xibs.trendingMovieCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.Views.Xibs.trendingMovieCollectionViewCell)
    }
    
}
extension TrendingMoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.moviesViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Views.Xibs.trendingMovieCollectionViewCell, for: indexPath) as! TrendingMovieCollectionViewCell
        cell.populateCell(data: MovieDefaultListModel(movie: viewModel.moviesViewModel[indexPath.row]))
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = viewModel.moviesViewModel[indexPath.row]
        model.didTap()
     }
}
