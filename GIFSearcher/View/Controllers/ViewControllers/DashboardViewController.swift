//
//  DashboardViewController.swift
//  GIFSearcher
//
//  Created by Константин Клинов on 9/9/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    /// The data model. Internal so the extension can access it.
    internal let viewModel = DashboardViewModel()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureViewModel()
        self.configureCollectionView()
        self.configureSearchBar()
        self.viewModel.setNeedsRefresh()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Configuring the Collection View
    
    func configureCollectionView()
    {
        self.configure(collectionView: self.collectionView)
    }
    
    func configure(collectionView: UICollectionView)
    {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = GiphyLayout()
        layout.scrollDirection = .vertical
        
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        
        let height = collectionView.bounds.size.height / 3.0
        let width = collectionView.bounds.size.width / 3.0
        
        layout.itemSize = CGSize(width: width, height: height)
        collectionView.contentInset = .zero
        
        collectionView.collectionViewLayout = layout
        
    }
    
    // MARK: - Configuring the Search Bar
    
    /// Set up the search bar.
    func configureSearchBar()
    {
        self.searchBar.delegate = self
        self.searchBar.placeholder = NSLocalizedString("Type to Search Giphy", comment: "A string with search instructions.")
    }
    
    // MARK: - Configuring Our Response to ViewModel Updates
    
    /// Sets a refresh handler that is executed whenever the
    /// ViewModel refreshes its data.
    func configureViewModel()
    {
        self.viewModel.refreshHandler = { [weak self] in
            
            guard let strongSelf = self else {
                return
            }
            
            DispatchQueue.main.async {
                
                strongSelf.title = strongSelf.viewModel.title
                
                strongSelf.collectionView.performBatchUpdates({
                    let itemIndexSet = IndexSet(integer: 0)
                    strongSelf.collectionView.reloadSections(itemIndexSet)
                }) { (complete: Bool) in
                    strongSelf.collectionView.reloadData()
                }
                
                strongSelf.collectionView.refreshControl?.endRefreshing()
            }
        }
        
    }
    
    // MARK: - Manually Refreshing
    
    func refresh()
    {
        self.collectionView.refreshControl?.beginRefreshing()
        self.viewModel.setNeedsRefresh()
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.numberOfItems(in: section)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.viewModel.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gifCell", for: indexPath) as! GIFCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if collectionView == self.collectionView
        {
            self.collectionView.contentOffset = self.collectionView.contentOffset
                }
        
        let _ = self.viewModel.gif(for: indexPath) { (data: Data?, originalIndexPath: IndexPath) in
            DispatchQueue.main.async {
                if indexPath == originalIndexPath
                {
                    if let data = data
                    {
                        let image =  UIImage.gif(from: data)
                        if let cell = collectionView.cellForItem(at: originalIndexPath) as? GIFCollectionViewCell
                        {
                            cell.imageView.image = image
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.collectionView
        {
            self.collectionView.contentOffset = self.collectionView.contentOffset
        }
    }
}

