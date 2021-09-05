//
//  GameListTests.swift
//  LeanScaleTaskTests
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import XCTest
@testable import LeanScaleTaskDev

class GameListTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testOpenGame(){
        let interactor = GameListInteractor(gameReprository: GameMockReprository(), openedGameReprository: OpenedGameMockReprository(), presenter: nil)
        let presenter = GameListPresenter(interactor: interactor, view: nil, router: nil)
        interactor.presenter = presenter
        presenter.onScreenAppeared()
        presenter.onGameSelected(index: 5)
        XCTAssert(presenter.cells[4].color == UIColor.lightGray)

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
