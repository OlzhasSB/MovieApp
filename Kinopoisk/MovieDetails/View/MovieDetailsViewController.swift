//
//  HomeViewController.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 23.05.2022.
//

import UIKit

protocol MovieDetailsViewInput: AnyObject {
    func handleObtainedMovieDetails(_ details: Movie)
}

protocol MovieDetailsViewOutput {
    func didLoadView()
    func didSelectCastCell(at cast: PersonEntity)
}

class MovieDetailsViewController: UIViewController {
    
    var output: MovieDetailsViewOutput?
    var dataDisplayManager: MovieDetailsDataDisplayManager?

    private var networkManager = AlamofireNetworkManager.shared
    
    @IBOutlet private var myCollectionView: UICollectionView!
    @IBOutlet private var movieDetailsLabel: UILabel!
    @IBOutlet private var posterImageView: UIImageView!
    @IBOutlet private var movieTitleLabel: UILabel!
    @IBOutlet private var movieDateLabel: UILabel!
    
//    var movie: Movie!
//    var creditsIds: [Actor] = []
//    var cast: [PersonEntity] = [] {
//        didSet {
//            self.myCollectionView.reloadData()
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        assign()
//        loadCredits()
        
        output?.didLoadView()
    }
    
    private func register() {
        myCollectionView.dataSource = dataDisplayManager
        myCollectionView.delegate = dataDisplayManager
    }
    
    func assign() {

    }
    
}

// MARK: - Network Call
//extension MovieDetailsViewController {
//
//    func loadCredits() {
//        let movieId = movie.id
//        networkManager.getCredits(path: "/3/movie/\(movieId)/credits") { [weak self] ids in
//            self?.creditsIds = ids
//            self?.getCast()
//        }
//
//    }
//
//    func getCast() {
//        for id in creditsIds {
//            networkManager.getCast(path: "/3/person/\(id.id)") { [weak self] person in
//                self?.cast.append(person)
//            }
//        }
//    }
//
//}

extension MovieDetailsViewController: MovieDetailsViewInput {

    func handleObtainedMovieDetails(_ details: Movie) {
        movieDetailsLabel.text = details.overview
        movieTitleLabel.text = details.originalTitle
        movieDateLabel.text = details.releaseDate
        title = details.originalTitle
        
        let url = URL(string: details.posterUrl ?? "")
        posterImageView.kf.setImage(with: url)
    }

}
