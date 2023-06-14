//
//  PlayGameViewController.swift
//  BeGame
//
//  Created by Алексей Ревякин on 09.06.2023.
//

import UIKit

class PlayGameViewController: UIViewController {
    private var appDidEnterBackgroundDate: Date?
    
    var viewModel: PlayGameViewModelProtocol?
    
    private var scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    private lazy var gameImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        guard let imageData = viewModel?.getGameImage() else { return imageView}
        imageView.image = UIImage(data: imageData)
        return imageView
    }()
    
    private var timer: Timer?
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 80)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(PlayGameCollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    private lazy var playerTableView: UITableView = {
       let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.isScrollEnabled = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    override func viewDidAppear(_ animated: Bool) {
        scrollView.contentSize = scrollView.intrinsicContentSize
    }

    private func configure() {
        view.backgroundColor = .white
        navigationItem.title = viewModel?.game.name
        
        view.addSubview(scrollView)
        scrollView.addSubview(gameImageView)
        scrollView.addSubview(collection)
        createTimer()
        NotificationCenter.default.addObserver(self, selector: #selector(applicationDidEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillEnterBackground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        gameImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(7)
            make.width.height.equalTo(view.bounds.width * 0.33)
            make.centerX.equalToSuperview()
        }
        collection.snp.makeConstraints { make in
            make.top.equalTo(gameImageView.snp.bottom).offset(20)
            make.left.equalTo(view).offset(40)
            make.right.equalTo(view).offset(-40)
            make.height.equalTo(80)
        }
    }
}

//MARK: - UITableViewDataSource
extension PlayGameViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

//MARK: - UITableViewDelegate
extension PlayGameViewController: UITableViewDelegate {
    
}

//MARK: UICollectionViewDataSource
extension PlayGameViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? PlayGameCollectionViewCell else { return UICollectionViewCell() }
        let viewModelCell = viewModel?.getPlayGameCollectionViewCellViewModel(for: indexPath)
        cell.viewModel = viewModelCell
        return cell
    }
}

//MARK: UICollectionViewDelegate
extension PlayGameViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.row == 0 else { return }
        guard let cell = collection.cellForItem(at: indexPath) as? PlayGameCollectionViewCell else { return }
        cell.viewModel?.isTimerPlay.toggle()
        guard let viewModel = cell.viewModel else { return }
        if viewModel.isTimerPlay {
            createTimer()
        } else {
            timer?.invalidate()
            timer = nil
            
        }
    }
}

//MARK: - Timer
extension PlayGameViewController {
    private func createTimer() {
        if timer == nil {
            let timer = Timer.scheduledTimer(timeInterval: 1.0,
                                         target: self,
                                         selector: #selector(updateTime),
                                         userInfo: nil,
                                         repeats: true)
            RunLoop.current.add(timer, forMode: .common)
            timer.tolerance = 0.1
            self.timer = timer
        }
    }
    
    @objc func updateTime() {
        guard let time = viewModel?.updateTime(), let cell = collection.cellForItem(at: IndexPath(row: 0, section: 0)) as? PlayGameCollectionViewCell else { return }
        cell.setTextLabel(text: time)
    }
    
    @objc private func applicationDidEnterBackground(_ notification: NotificationCenter) {
        appDidEnterBackgroundDate = Date()
    }
    
    @objc private func applicationWillEnterBackground(_ notification: NotificationCenter) {
        guard let cell = collection.cellForItem(at: IndexPath(row: 0, section: 0)) as? PlayGameCollectionViewCell, let isTimerPlay = cell.viewModel?.isTimerPlay else { return }
        guard let previousDate = appDidEnterBackgroundDate, isTimerPlay else { return }
        let calendar = Calendar.current
        let difference = calendar.dateComponents([.second], from: previousDate, to: Date())
        let seconds = difference.second!
        viewModel?.addTime(seconds: seconds)
    }
}
