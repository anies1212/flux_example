//
//  Action.swift
//  flux-sample
//
//  Created by 新垣 清奈 on 2023/02/07.
//

import Foundation
import RxSwift
import RxRelay

final class Action {
    let didTapFluxButton = PublishRelay<Void>()
    private let dispatcher: Dispatcher
    private let disposeBag = DisposeBag()

    init(dispatcher: Dispatcher = .shared) {
        self.dispatcher = dispatcher

        didTapFluxButton
            .subscribe(with: self, onNext: { owner, _ in
                owner.dispatcher.didTapFluxButton.dispatch(())
            })
            .disposed(by: disposeBag)
    }
}
