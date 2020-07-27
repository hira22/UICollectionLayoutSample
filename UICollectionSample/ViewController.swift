//
//  ViewController.swift
//  UICollectionSample
//
//  Created by hiraoka on 2020/06/29.
//  Copyright © 2020 hiraoka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<String, Question.Option.Selection>! = nil
    
    // MARK: listLayout
    private lazy var listLayout: UICollectionViewLayout = {
        // Item
        let itemSize: NSCollectionLayoutSize = .init(widthDimension: .fractionalWidth(1.0),
                                                     heightDimension: .fractionalHeight(1.0))
        let item: NSCollectionLayoutItem = .init(layoutSize: itemSize)
        
        // Group
        let groupSize: NSCollectionLayoutSize = .init(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .estimated(44))
        let group: NSCollectionLayoutGroup = .horizontal(layoutSize: groupSize, subitems: [item])
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 5
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        // Section - Header
        let headerSize: NSCollectionLayoutSize = .init(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .estimated(44))
        let header: NSCollectionLayoutBoundarySupplementaryItem = .init(layoutSize: headerSize, elementKind: "header", alignment: .top)
        section.boundarySupplementaryItems = [header]
        
        // Layout
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }()
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: CollectionViewCell.reuseIdentifier, bundle: nil),
                                forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
        collectionView.register(UINib(nibName: SectionHeaderView.reuseIdentifier, bundle: nil),
                                forSupplementaryViewOfKind: "header",
                                withReuseIdentifier: SectionHeaderView.reuseIdentifier)
        
        collectionView.setCollectionViewLayout(self.listLayout, animated: true)
        configureDataSource()
    }
    
    // MARK: configureDataSource
    private func configureDataSource() {
        self.dataSource = UICollectionViewDiffableDataSource<String, Question.Option.Selection>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Question.Option.Selection) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell( withReuseIdentifier: CollectionViewCell.reuseIdentifier,
                                                                 for: indexPath) as? CollectionViewCell else { fatalError("Cannot create new cell") }
            
            cell.label.text = identifier.title
            return cell
        }
        
        self.dataSource.supplementaryViewProvider = {
            (collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? in
            
            guard let supplementaryView = collectionView.dequeueReusableSupplementaryView( ofKind: kind,
                                                                                           withReuseIdentifier: SectionHeaderView.reuseIdentifier,
                                                                                           for: indexPath) as? SectionHeaderView else { fatalError("Cannot create new supplementary") }
            
            supplementaryView.label.text = testData[indexPath.section].title
            return supplementaryView
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<String, Question.Option.Selection>()
        testData.forEach { (section: Question) in
            snapshot.appendSections([section.title])
            snapshot.appendItems(section.options?.selections ?? [])
        }
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
