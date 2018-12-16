//
//  ViewController.swift
//  SQLIteExample
//
//  Created by Scott Lee on 2016. 10. 4..
//  Copyright © 2016년 Studio G.B.U. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var memo: UITextField!
    
    var databasePath = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fileMgr = FileManager.default
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPaths[0]
        databasePath = docsDir + "/test.db"
        
        if !fileMgr.fileExists(atPath: databasePath as String) {
            let db = FMDatabase(path:databasePath as String)
            
            if db == nil {
                NSLog("DB 생성 오류")
            }
            
            if ((db?.open()) != nil) {
                let sql_statement = "Create table if not exists test(id integer primary key autoincrement, memo text)"
                
                if !(db?.executeStatements(sql_statement))! {
                    NSLog("테이블 생성 오류")
                }
                
                db?.close()
            } else {
                NSLog("디비 연결 오류")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveMemo(_ sender: UIButton) {
        let db = FMDatabase(path:databasePath as String)
        
        if ((db?.open()) != nil) {
            let insertQuery = "insert into test(memo) values('\(memo.text!)')"
            db?.executeUpdate(insertQuery, withArgumentsIn: nil)
            
            if ((db?.hadError()) != nil) {
                NSLog("저장 오류 \(insertQuery)")
            } else {
                NSLog("저장 성공 \(insertQuery)")
            }
        } else {
            NSLog("디비 연결 오류")
        }
    }
    
    @IBAction func loadMemo(_ sender: UIButton) {
        let db = FMDatabase(path:databasePath as String)
        
        if ((db?.open()) != nil) {
            let selectQuery = "select memo from test order by id desc limit 1"
            let result:FMResultSet? = db?.executeQuery(selectQuery, withArgumentsIn:nil)
            
            if result != nil{
                while result!.next() {
                    memo.text = result!.string(forColumn: "memo")
                    NSLog("자료 불러오기 성공")
                }
            } else {
                NSLog("자료 불러오기 실패")
            }
        } else {
            NSLog("디비 연결 오류")
        }
    }
}

