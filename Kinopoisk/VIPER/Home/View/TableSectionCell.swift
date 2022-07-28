//
//  SectionCell.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 24.05.2022.
//

import UIKit

//protocol ShowListDelegate {
//    func goToAllMovies(_ index: Int) -> Void
//    func showDescription(for section: Int, id: Int)
//}

class TableSectionCell: UITableViewCell {
    
//    var delegate: ShowListDelegate?
    
//    private var movies: [Movie] = [] {
//        didSet {
//            sectionCollectionView.reloadData()
//        }
//    }
    
//    var genres: [Genre] = []
//    var index: Int!
    
    var dataDisplayManager: HomeDataDisplayManager?
    
    @IBOutlet var sectionLabel: UILabel!
    @IBOutlet var sectionCollectionView: UICollectionView!
    
    @IBAction func allButtonPressed(_ sender: UIButton) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sectionCollectionView.dataSource = dataDisplayManager
        sectionCollectionView.delegate = dataDisplayManager
    }
    
    func configure(with viewModel: (title: String?, movies: [Movie]), genres: [Genre]) {
        self.sectionLabel.text = viewModel.title
        print(viewModel.movies)
//        self.movies = viewModel.movies
//        self.genres = genres
    }
}

//extension TableSectionCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 128, height: 270)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return movies.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! CollectionSectionCell
//        cell.setUp(with: movies[indexPath.row], genres: genres)
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        delegate?.showDescription(for: index, id: indexPath.row)
//    }
//}
