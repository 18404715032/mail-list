//
//  chazhao.swift
//  mail list
//
//  Created by 杨浩 on 16/7/11.
//  Copyright © 2016年 杨浩. All rights reserved.
//

import UIKit

class chazhao: UIViewController {
    var db:SQLiteDB!
    
    @IBOutlet weak var p: UITextView!
    
    override func updateViewConstraints() {
        super.viewDidLoad()
        
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),email varchar(20),qq varchar(20))")
    }
    @IBAction func selete(sender: AnyObject) {
        sel()
    }
    
    @IBAction func seletee(sender: AnyObject) {
        sele()
    }
    
    func sel(){
        let value = p.text!
        p.text!=""
        let data = db.query("select * from user")
        for var x=0;x<data.count;x++
        {
            let u = data[x]
            p.text!  += "\n"+"姓名:"+String(u["uname"]!)+"\n"+"电话:"+String(u["mobile"]!)+"\n"+"邮箱"+String(u["email"]!)+"\n"+"QQ" + String(u["qq"]!) + "\n"
            
        }
    }
    func sele(){
    
        let value=p.text!
        p.text=""
        let data = db.query("select * from user")
        for var x=0;x<data.count;x++
        {
            let u = data[x]
            p.text!  += "\n"+"姓名:"+String(u["uname"]!)+"\n"+"电话:"+String(u["mobile"]!)+"\n"+"邮箱"+String(u["email"]!)+"\n"+"QQ" + String(u["qq"]!) + "\n"
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

