//
//  kan.swift
//  mail list
//
//  Created by 杨浩 on 16/7/6.
//  Copyright © 2016年 杨浩. All rights reserved.
//

import UIKit

class kan: UIViewController {
    
    @IBOutlet weak var h: UITextView!
    
    
    @IBOutlet weak var y: UITextView!
    
    @IBAction func sele(sender: AnyObject) {
        sel()
    }
    var db:SQLiteDB!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = SQLiteDB.sharedInstance()
        //db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),email varchar(20),qq varchar(20))")
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),email varchar(20),qq varchar(20))")
        //initUser()
        
    }
    @IBAction func k(sender: AnyObject) {
        initUser()
    }
    func initUser()
    {
        let date = db.query("select * from user")
        for var i=1 ; i < date.count; i++
        {
            let u = date[i]
            y.text! += "\(i)"
            y.text! += "\n"+"姓名:"+String(u["uname"]!)+"\n"+"电话:"+String(u["mobile"]!)+"\n"+"邮箱"+String(u["email"]!)+"\n"+"QQ" + String(u["qq"]!) + "\n"
        }
    }
    func sel(){
        //h.text!=""
        let value = h.text!
        //h.text!=""
        let data = db.query("select * from user where uname='\(value)' ")
        for var x=0 ; x<data.count; x++
        {
            let u = data[x]
           // h.text! += "\n" + "姓名:" + String(u["uname"]!) + "\n" + "电话:" + String(u["mobile"]!)+"\n" + "邮箱" + String(u["email"]!) + "\n" + "QQ" + String(u["qq"]!) + "\n"
            h.text! += "\n"+"姓名:"+String(u["uname"]!)+"\n"+"电话:"+String(u["mobile"]!)+"\n"+"邮箱"+String(u["email"]!)+"\n"+"QQ" + String(u["qq"]!) + "\n"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
    