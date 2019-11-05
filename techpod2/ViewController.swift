//
//  ViewController.swift
//  techpod2
//
//  Created by Yuto Wakabayashi on 2019/10/27.
//  Copyright © 2019 com.litech. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    //曲名を入れるための配列
    var songNameArray = [String]()
    //曲のファイルを入れるための配列
    var fileNameArray = [String]()
    //音楽家の画像を入れるための配列
    var imageNameArray = [String]()
    
    //音楽を再生するための変数
    var audioPayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.//TableViewのデータソースメソッドはViewControllerクラスに書くよ、という設定
        table.dataSource = self
        
        //TableViewのデリゲートメソッドはViewControllerメソッドに書くよ、という設定
        table.delegate = self
        
        //SongNameArrayに曲名を入れていく
        songNameArray = ["カノン", "エリーゼのために", "G戦場のアリア"]
        
        //fileNameArrayにファイル名を入れていく
        fileNameArray = ["cannon", "elise", "aria"]
        
        //imageNameArrayに曲の画像の名前を入れていく
        imageNameArray = ["Pachelbel.jpg", "Beethoven.jpg", "Bach.jpg"]
        
    }
    
    //Cellの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Cellの数をSongNameArrayの数にする
        return songNameArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        //CellにSongNameArrayの名前を表示
        cell?.textLabel?.text = songNameArray[indexPath.row]
        
        //Cellに音楽家の画像を表示
        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        
        return cell!
    }
    //Cellが押された時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選ばれました")
        
        //音楽ファイルの設定
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        
        //再生の準備
        audioPayer = try? AVAudioPlayer(contentsOf: audioPath)
        
        //音楽を再生
        audioPayer.play()
        
    }
    
    
}

