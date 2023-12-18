//
//  HomeViewController.swift
//  OkxUIlib
//
//  Created by David Chang on 12/18/23.
//

import Foundation

public class HomeViewController : UIViewController {
    
    var videosView : UICollectionView!
    var videosViewDataSource : VideoViewDataSource?
    
    var viewModel : HomeViewViewModel = HomeViewViewModel()
    
    let TopMargin = 60.0
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVideoView()
    }
    
    public func showData(rawData: [(String, String)]) {
        viewModel.parse(rawData: rawData)
        
        videosView.reloadData()
    }
    
    func setupVideoView() {
        let layout = UICollectionViewFlowLayout()
        let width = view.bounds.width
        let height = view.bounds.width
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        videosView = UICollectionView(frame: CGRect(x: 0, y: TopMargin, width: width, height: height), collectionViewLayout: layout)
        videosView.autoresizingMask = [.flexibleLeftMargin, .flexibleBottomMargin]
        videosView.register(VideoCell.self, forCellWithReuseIdentifier: VideoCell.cellReuseIdentifier)
        
        videosViewDataSource = VideoViewDataSource(viewmodel: viewModel)
        videosView.dataSource = videosViewDataSource
        videosView.showsHorizontalScrollIndicator = false
        videosView.delegate = self
        view.addSubview(videosView)
    }
    
}

extension HomeViewController : UICollectionViewDelegate {
    public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if let collectionView = scrollView as? UICollectionView {
            targetContentOffset.pointee = collectionView.contentOffset
            var indexes = collectionView.indexPathsForVisibleItems
            indexes.sort()
            var index = indexes.first!
            let cell = collectionView.cellForItem(at: index)!
            let position = collectionView.contentOffset.x - cell.frame.origin.x
            if position > cell.frame.size.width/2{
                index.row = index.row+1
            }
            collectionView.scrollToItem(at: index, at: .left, animated: true)
        }
    }
    
}
