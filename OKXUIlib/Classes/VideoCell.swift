//
//  VideoCell.swift
//  OkxUIlib
//
//  Created by David Chang on 12/18/23.
//

import Foundation
import AVFoundation
import Cache
import CachingPlayerItem

class VideoCell : UICollectionViewCell {
    static let cellReuseIdentifier = "VideoCellReuseIdentifier"
 
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    var dataItem : DataItem?
    
    var storage : Storage<Data>?
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        let diskConfig = DiskConfig(name: "DiskCache")
        let memoryConfig = MemoryConfig(expiry: .never, countLimit: 10, totalCostLimit: 10)
        
        storage = try? Storage(
          diskConfig: diskConfig,
          memoryConfig: memoryConfig,
          transformer: TransformerFactory.forCodable(ofType:Data.self)
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("Do not support")
    }
    
    func setData(data: DataItem) {
        dataItem = data
        self.backgroundColor = UIColor.white
        let url = URL(string:data.videoURL)
        guard url != nil else {
            return
        }

        play()
    }
    
    
    func play() {
        if (player == nil) {
            storage?.async.entry(forKey: dataItem!.videoURL, completion: { result in
                let playerItem: CachingPlayerItem
                switch result {
                case .error:
                    // The track is not cached.
                    playerItem = CachingPlayerItem(url: URL(string: self.dataItem!.videoURL)!)
                    playerItem.delegate = self
                case .value(let entry):
                    // The track is cached.
                    do {
                        playerItem = try CachingPlayerItem(data: entry.object, customFileExtension: "mp4")
                    } catch {
                        // Handle the error
                        print("Error: \(error)")
                        return
                    }
                }
                playerItem.delegate = self
                self.player = AVPlayer(playerItem: playerItem)
                
                self.playerLayer = AVPlayerLayer(player: self.player)

                self.layer.addSublayer(self.playerLayer!)
                
                self.playerLayer?.frame = self.contentView.bounds
                self.playerLayer?.videoGravity = .resizeAspect
                self.player?.play()

                NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem, queue: .main) { [weak self] _ in
                    self?.player?.seek(to: CMTime.zero)
                    self?.player?.play()
                }

            })
        } else {
            player?.play()
        }
    }
    
    func pause() {
        player?.pause()
    }
    
    override func prepareForReuse() {
        if (player?.currentItem != nil) {
            NotificationCenter.default.removeObserver(player!.currentItem!)
        }
        super.prepareForReuse()
        pause()
        playerLayer?.removeFromSuperlayer()
        player = nil
        playerLayer = nil
    }
}

extension VideoCell : CachingPlayerItemDelegate {
    func playerItem(_ playerItem: CachingPlayerItem, didFinishDownloadingFileAt filePath: String) {
        if FileManager.default.fileExists(atPath: filePath){
            do {
                let certData : Data = try Data(contentsOf: URL(fileURLWithPath: filePath))
                storage?.async.setObject(certData, forKey: dataItem!.videoURL, completion: { _ in })
                // Process the certData as needed
            } catch {
                // Handle the error
                print("Error: \(error)")
            }
        }
    }
}
