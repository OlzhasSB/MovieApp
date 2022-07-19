//
//  HomeViewController.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 23.05.2022.
//

import UIKit

class MovieDetailsViewController: UIViewController, MovieManagerDelegate {
    
    private var networkManager = AlamofireNetworkManager.shared
    
    @IBOutlet private var myCollectionView: UICollectionView!
    @IBOutlet private var movieDetailsLabel: UILabel!
    @IBOutlet private var posterImageView: UIImageView!
    @IBOutlet private var movieTitleLabel: UILabel!
    @IBOutlet private var movieDateLabel: UILabel!
    
    var movie: Movie!
    
    var creditsIds: [Actor] = []
    var cast: [PersonEntity] = [] {
        didSet {
            self.myCollectionView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        assign()
        loadCredits()
    }
    
    private func register() {
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
    }
    
    func assign() {
        movieDetailsLabel.text = movie.overview
        movieTitleLabel.text = movie.originalTitle
        movieDateLabel.text = movie.releaseDate
        title = movie.originalTitle
        
        let url = URL(string: movie.posterUrl ?? "")
        posterImageView.kf.setImage(with: url)
    }
    
    
    func didUpdateMovies(movieList: MovieData) {
//        films = movieList
//        print(films.results[0].overview)
    }
    
}

extension MovieDetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return actors.count
        return cast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CastCell
        if cast.count > 0 {
            cell.setUp(with: cast[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "CastMemberViewController") as? CastMemberViewController {
            vc.cast = cast[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension MovieDetailsViewController {
    
    func loadCredits() {
        let movieId = movie.id
        networkManager.getCredits(path: "/3/movie/\(movieId)/credits") { [weak self] ids in
            self?.creditsIds = ids
            self?.getCast()
        }
        
    }
    
    func getCast() {
        for id in creditsIds {
            networkManager.getCast(path: "/3/person/\(id.id)") { [weak self] person in
                self?.cast.append(person)
            }
        }
    }
    
}
