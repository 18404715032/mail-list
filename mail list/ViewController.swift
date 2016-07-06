//
//  ViewController.swift
//  mail list
//
//  Created by 杨浩 on 16/7/1.
//  Copyright © 2016年 杨浩. All rights reserved.
////杨浩
import UIKit

class ViewController: UIViewController {

    var db:SQLiteDB!
    @IBOutlet var txtUname:UITextField!
    @IBOutlet var txtMobile: UITextField!
    @IBOutlet var txtemail: UITextField!
    @IBOutlet var txtqq: UITextField!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        //db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20),email varchar(20),qq varchar(20))")
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),email varchar(20),qq varchar(20))")
        //如果有数据则加载
        //initUser()
    }
    
    //点击保存
    @IBAction func saveClicked(sender: AnyObject) {
        saveUser()
    }
    
    //从SQLite加载数据
    func initUser() {
        let data = db.query("select * from user")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            txtUname.text = user["uname"] as? String
            txtMobile.text = user["mobile"] as? String
            txtemail.text = user["email"] as? String
            txtqq.text = user["qq"] as? String
        }
    }
    
    //保存数据到SQLite
    func saveUser() {
        let uname = self.txtUname.text!
        let mobile = self.txtMobile.text!
        let email = self.txtemail.text!
        let qq = self.txtqq.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into user(uname,mobile,email,qq) values('\(uname)','\(mobile)','\(email)','\(qq)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }

}

