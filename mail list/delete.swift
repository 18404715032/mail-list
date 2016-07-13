//
//  delete.swift
//  mail list
//
//  Created by 杨浩 on 16/7/6.
//  Copyright © 2016年 杨浩. All rights reserved.
//

import UIKit

class delete: UIViewController {
    @IBOutlet weak var name1: UITextField!
    var db:SQLiteDB!
    override func viewDidLoad(){
        super.viewDidLoad()
        db = SQLiteDB.sharedInstance()
       // db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),email varchar(20),qq varchar(20))")
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),email varchar(20),qq varchar(20))")
        
    }
    
    @IBAction func deleee(sender:AnyObject){
        var alert = UIAlertView(title: "提示", message: "联系人已删除", delegate: self, cancelButtonTitle: "确定")
        alert.alertViewStyle = UIAlertViewStyle.Default
        
        alert.show()
            del()
        
    }
    func del(){
        let a=name1.text!
        let sql = "delete from user where uname='\(a)'"
        let result = db.execute(sql)
        print(result)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}