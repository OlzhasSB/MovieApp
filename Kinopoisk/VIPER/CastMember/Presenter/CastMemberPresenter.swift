//
//  CastMemberPresenter.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 25.07.2022.
//

import Foundation

final class CastMemberPresenter: CastMemberViewOutput, CastMemberModuleInput {
    
    weak var view: CastMemberViewInput?
    
    private var cast: PersonEntity!
    
    func configure(with cast: PersonEntity) {
        self.cast = cast
    }
    
    func didLoadView() {
        view?.handleObtainedCast(cast)
    }
    
}
