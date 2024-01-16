//
//  UserListViewModel.swift
//  TestApp
//
//  Created by shaiju on 08/01/24.
//

import UIKit

class UserListViewModel {

    /// object cretion for network layer
    private let networkManager = NetworkManager()
    
    /// call back declartion
    var reloadTableView: (()->())?
    var showLoading: (()->())?
    var hideLoading: (()->())?
    var showError: (()->())?

    /// returns the row count
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    /// data viewmodel declaration
    private var cellViewModels: [Users] = [Users]() {
        didSet {
            self.reloadTableView?()
        }
    }
    
    /// method to call the api to get user details
    public func getUserList() {
            showLoading?()
            networkManager.getUserdetails { [weak self](result) in
                self?.hideLoading?()
                switch result {
                case .success(let result):
                guard let userList = result.users else { return }
                self?.setCellData(userData: userList)
                self?.reloadTableView?()
                case .failure(let error):
                print(error)
                self?.showError?()
            }
        }
    }
    
    /// returns the userobject to display in the tableview cell
    /// - Parameter indexPath: indexpath
    /// - Returns: returning the user object to display in tableviewcell
   public func getCellViewModel( at indexPath: IndexPath ) -> Users {
        return cellViewModels[indexPath.row]
    }
    
    /// function supplay the view model data
    /// - Parameter userData: user data array
   private func setCellData(userData: [Users]){
        cellViewModels = userData
    }
}

