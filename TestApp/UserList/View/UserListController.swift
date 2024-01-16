//
//  ViewController.swift
//  TestApp
//
//  Created by shaiju on 08/01/24.
//

import UIKit
import MBProgressHUD

class UserListController: UIViewController {

// @IBOutlets declaration
@IBOutlet weak var userListTableView: UITableView!

//Objects declaration
private let userListViewModel = UserListViewModel()
private var userList = [Users]()
   
    
    /// view controller lifecycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        registerTableaviewCell()
        initViewModel()
    }
    
    ///  viewmodel initilizer method
    private func initViewModel() {
        userListViewModel.reloadTableView = {
            DispatchQueue.main.async { self.userListTableView.reloadData() }
        }
        userListViewModel.showLoading = {
            DispatchQueue.main.async {  MBProgressHUD.showAdded(to: self.view, animated: true)
            }
        }
        userListViewModel.hideLoading = {
            DispatchQueue.main.async {  MBProgressHUD.hide(for: self.view, animated: false)
            }
            
            self.userListViewModel.showError = {
                DispatchQueue.main.async { self.showAlert(Appconsatants.errorMessage.rawValue) }
            }
        }
        self.userListViewModel.getUserList()
    }
    
    /// register the tableview cell
   private func registerTableaviewCell() {
        userListTableView.register(UserListTableViewCell.nib, forCellReuseIdentifier: UserListTableViewCell.identifier)
    }
    
    ///  confirming tableview delegates
    private func configureTableView() {
        userListTableView.dataSource = self
        userListTableView.delegate = self
    }
    
    /// method for showing alert
    /// - Parameter message: message to shown in alert preview
    private func showAlert( _ message: String ) {
        let alert = UIAlertController(title: Appconsatants.error.rawValue, message: message, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
   
    /// function to navigate to detail screen
    /// - Parameter userObject: the object need to pass from list controller to detail controller
    private func navigateToDetailPage(userObject: Users) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: Appconsatants.detailPageStoryBoardId.rawValue) as? UserDetailsController else { return }
        vc.modalPresentationStyle = .fullScreen
        vc.userDetail = userObject
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// Table view Delegate methods
extension UserListController: UITableViewDataSource,UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userListViewModel.numberOfCells
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UserListTableViewCell.identifier, for: indexPath) as! UserListTableViewCell
        let userData = userListViewModel.getCellViewModel(at: indexPath)
        cell.setUserData(user: userData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userData = userListViewModel.getCellViewModel(at: indexPath)
        navigateToDetailPage(userObject: userData)
    }
}
