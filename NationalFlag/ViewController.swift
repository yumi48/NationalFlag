//
//  ViewController.swift
//  NationalFlag
//
//  Created by 木村由美 on 2020/02/22.
//  Copyright © 2020 木村由美. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var myTV: UITableView!
    @IBOutlet weak var myIV: UIImageView!
    
    //国名の一覧
    var country: [String] = ["アメリカ","日本","韓国","イギリス","フランス","ドイツ","イタリア","カナダ","中国","ジャマイカ"]
    
    //国旗の画像ファイル名一覧
    var flags: [String] = ["America.png","Japan.png","Korea.png","Britain.png","France.png","Germany.png","Italy.png","Canada.png","China.png","Jamaica.png"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //デリゲート・データソースの移譲の設定
        myTV.delegate = self
        myTV.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    //テーブルビューに表示するセルの数を返すメソッド
    //国名の配列が増えた場合にも柔軟に対応するため、「配列countryの要素の数」を返しています。
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country.count
    }
    
    //テーブルビューに表示するセルを返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //ストーリーボード上のセル「myCell」を上で指定したセル数の分だけ量産して、
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath as IndexPath)
        
        //そのセルのラベルのテキストに国名の配列を１つずつはめ込んでいきます。
        cell.textLabel?.text = country[indexPath.row]
        
        //同様にしてセルのイメージビューの画像に、各国の画像ファイル名で指定した画像を１つずつはめ込んでいきます。
        cell.imageView?.image = UIImage(named: flags[indexPath.row])
        
        //出来上がったセルを戻り値に指定しておしまい。
        return cell
    }
    
    //セルがタップされた際の動画を実装するメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Outlet接続したmyIVの画像(image)を、配列flagsの画像ファイル名のものに変更する
        myIV.image = UIImage(named: flags[indexPath.row])
    }
}

