//
//  CastMemberViewController.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 24.05.2022.
//

import UIKit

class CastMemberViewController: UIViewController {
    @IBOutlet private var castImageView: UIImageView!
    @IBOutlet private var castNameLabel: UILabel!
    @IBOutlet private var castBirthdayLabel: UILabel!
    @IBOutlet private var castDepartmentLabel: UILabel!
    @IBOutlet private var castBiographyLabel: UILabel!
    
    var cast: PersonEntity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assign()
    }
    
    private func assign() {
        castNameLabel.text = cast.name
        castBirthdayLabel.text = cast.birthday
        castDepartmentLabel.text = cast.known_for_department
        castBiographyLabel.text = cast.biography
        
        let url = URL(string: "https://image.tmdb.org/t/p/w200\(cast.profile_path)")
        castImageView.kf.setImage(with: url)
    }
}
