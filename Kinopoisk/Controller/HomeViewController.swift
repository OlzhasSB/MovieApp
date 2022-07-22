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

// MARK: TableView Delegates
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

// MARK: - Show Delegates
extension HomeViewController: ShowListDelegate {
    
    func goToAllMovies(_ index: Int) {
        let movies = sectionMovies[index]
        let viewController = MovieNewsModuleAssembly().assemble { (input) in
            input.configure(with: movies)
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showDescription(for section: Int, id: Int) {
        let movie = sectionMovies[section][id]
        let viewController = MovieDetailsModuleAssembly().assemble { (input) in
            input.configure(with: movie)
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

// MARK: - Network Call
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
        }
    }
    
}
