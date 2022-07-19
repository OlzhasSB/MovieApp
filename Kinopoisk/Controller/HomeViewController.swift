//
//  TestViewController.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 24.05.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private var sectionTableView: UITableView!
    
    private var networkManager = AlamofireNetworkManager.shared
    private var genres: [Genre] = []
    var sectionNames: [String] = ["Today at the cinema", "Soon at the cinema", "Trending movies"]
    
    lazy var sectionMovies: [[Movie]] = [] {
        didSet {
            sectionTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"
        setUp()
        loadGenres()
        loadMovies()
        
    }
    
    private func setUp() {
        sectionTableView.dataSource = self
        sectionTableView.delegate = self
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionCell") as! TableSectionCell
        if sectionMovies.count > 0 {
            cell.configure(with: (sectionNames[indexPath.row], movies: sectionMovies[indexPath.row]), genres: genres)
        }
        cell.index = indexPath.row
        cell.delegate = self
        return cell
    }
}

extension HomeViewController: ShowListDelegate {
    func goToAllMovies(_ index: Int) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "MovieNewsViewController") as? MovieNewsViewController {
            vc.movies = self.sectionMovies[index]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func showDescription(for section: Int, id: Int) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController {
//            vc.movieId = self.sectionMovies[section][id].id
            vc.movie = self.sectionMovies[section][id]
//            print(self.sectionMovies[section][id])
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension HomeViewController {
    
    private func loadGenres() {
        networkManager.loadGenres { [weak self] genres in
            guard let self = self else { return }
            self.genres = genres
        }
    }
    
    private func loadMovies() {
        networkManager.loadTodayMovies { [weak self] movies in
            self?.sectionMovies.append(movies)
        }
        networkManager.loadSoonMovies { [weak self] movies in
            self?.sectionMovies.append(movies)
        }
        networkManager.loadTrendingMovies { [weak self] movies in
            self?.sectionMovies.append(movies)
//            self?.sectionTableView.reloadData()
        }
    }
}
