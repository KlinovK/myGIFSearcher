//
//  DashboardViewController+Search.swift
//  GIFSearcher
//
//  Created by Константин Клинов on 9/9/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

extension DashboardViewController: UISearchBarDelegate {
    
    // MARK: - UISearchBarDelegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        self.viewModel.searchTerm = searchText
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.viewModel.searchTerm = nil
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
