//
//  HomeViewController.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 23.05.2022.
//

import UIKit

protocol MovieDetailsViewInput: AnyObject {
    func handleObtainedMovieDetails(_ details: Movie)
    func handleObtainedCast(_ cast: [PersonEntity])
}

protocol MovieDetailsViewOutput {
    func didLoadView()
    func didSelectCastCell(at cast: PersonEntity)
}

class MovieDetailsViewController: UIViewController {
    
    var output: MovieDetailsViewOutput?
    var dataDisplayManager: MovieDetailsDataDisplayManager?
    
    @IBOutlet private var castCollectionView: UICollectionView!
    @IBOutlet private var movieDetailsLabel: UILabel!
    @IBOutlet private var posterImageView: UIImageView!
    @IBOutlet private var movieTitleLabel: UILabel!
    @IBOutlet private var movieDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output?.didLoadView()
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        dataDisplayManager?.onCastMemberDidSelect = { [weak self] castDetails in
            self?.output?.didSelectCastCell(at: castDetails)
        }
        castCollectionView.dataSource = dataDisplayManager
        castCollectionView.delegate = dataDisplayManager
    }
    
}

extension MovieDetailsViewController: MovieDetailsViewInput {

    func handleObtainedMovieDetails(_ details: Movie) {
        movieDetailsLabel.text = details.overview
        movieTitleLabel.text = details.originalTitle
        movieDateLabel.text = details.releaseDate
        title = details.originalTitle
        
        let url = URL(string: details.posterUrl ?? "")
        posterImageView.kf.setImage(with: url)
    }
    
    func handleObtainedCast(_ cast: [PersonEntity]) {
        dataDisplayManager?.cast = cast
        castCollectionView.reloadData()
    }

}
