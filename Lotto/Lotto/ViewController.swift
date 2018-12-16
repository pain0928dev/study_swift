//
//  ViewController.swift
//  Lotto
//
//  Created by 402-24 on 15/12/2018.
//  Copyright © 2018 402-24. All rights reserved.
//

import UIKit
import FMDB

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var nowNum = 1
    var choiceNumber:[Int] = [Int]()
    var databasePath:String!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lottoCell", for: indexPath as IndexPath) as! LottoCell
        
        cell.lbl1.text = String(choiceNumber[0])
        cell.lbl2.text = String(choiceNumber[1])
        cell.lbl3.text = String(choiceNumber[2])
        cell.lbl4.text = String(choiceNumber[3])
        cell.lbl5.text = String(choiceNumber[4])
        cell.lbl6.text = String(choiceNumber[5])

        return cell
    }
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelect: \(indexPath.row)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        choiceNumber.append(0)
        choiceNumber.append(0)
        choiceNumber.append(0)
        choiceNumber.append(0)
        choiceNumber.append(0)
        choiceNumber.append(0)
        
        let fileMgr = FileManager.default
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPaths[0]
        databasePath = docsDir + "/lotto.db"
        
        /*
        print("Database Path: \(databasePath)")
        if fileMgr.fileExists(atPath: databasePath! as String) == true {
           print("파일이 존재")
            do {
                try fileMgr.removeItem(atPath: databasePath)
            } catch {
                print("error")
            }
        }
        */
        
        if !fileMgr.fileExists(atPath: databasePath! as String) {
           
            let db = FMDatabase(path:databasePath! as String)
            if db == nil {
                print("DB 생성 오류")
            }
            if ((db.open()) != nil) {
                let sql_statement = "Create table if not exists lotto(id integer primary key autoincrement, number1 integer, number2 integer, number3 integer, number4 integer, number5 integer, number6 integer)"
                if !(db.executeStatements(sql_statement)) { 
                    print("테이블 생성 오류")
                }
                db.close()
            } else {
                print("디비 연결 오류")
            }
            print("DB 생성 성공")
        }
    }
    
    func generateLottoNumber(){
        var allNumber:[Int] = [Int](0...45)

        var index = 0
        for i in 0...5 {
            index = Int(arc4random_uniform(UInt32(allNumber.count)))
            choiceNumber[i] = (allNumber[index])
            print("num: \(allNumber[index])")
            allNumber.remove(at: index)
        }
        
        choiceNumber.sort(by:{$0<$1})
    }

    @IBAction func barBtnDraw(_ sender: UIBarButtonItem) {
        print(#function)
        generateLottoNumber()
        
        tableView.beginUpdates()
        tableView.insertRows(at: [
            NSIndexPath(row: choiceNumber.count, section: 0) as IndexPath], with: .automatic)
        tableView.endUpdates()
        
        tableView.reloadData()
    }
    
    @IBAction func barBtnSave(_ sender: UIBarButtonItem) {
        print(#function)
        let db = FMDatabase(path:databasePath as String)
        if ((db.open()) != nil) {
            do{
                /*
                try db.executeUpdate("delete from lotto", values: [])
                if ((db.hadError()) != nil) {
                    NSLog("디비 초기화 오류")
                }
                */
                /*
                for numbers in choiceNumber {
                    let insertQuery = "insert into lotto(number1,number2, number3, number4, number5, number6) values (?,?,?,?,?,?)"
                    
                    //try db.executeUpdate(insertQuery, values: ["\(numbers[0])", "\(numbers[1])", "\(numbers[2])", "\(numbers[3])", "\(numbers[4])", "\(numbers[5])"])
                    try db.executeUpdate(insertQuery, values: [choiceNumber[0], choiceNumber[1], choiceNumber[2], choiceNumber[3],choiceNumber[4], choiceNumber[5]])
                    if ((db.hadError()) != nil) {
                        NSLog("저장 오류 \(insertQuery)")
                    }
                    else {
                        NSLog("저장 성공 \(insertQuery)")
                    }
                }
                */
                let insertQuery = "insert into lotto(number1,number2, number3, number4, number5, number6) values (?,?,?,?,?,?)"
                
                //try db.executeUpdate(insertQuery, values: ["\(numbers[0])", "\(numbers[1])", "\(numbers[2])", "\(numbers[3])", "\(numbers[4])", "\(numbers[5])"])
                try db.executeUpdate(insertQuery, values: [choiceNumber[0], choiceNumber[1], choiceNumber[2], choiceNumber[3],choiceNumber[4], choiceNumber[5]])
                //try db.executeQuery(insertQuery, values: [choiceNumber[0], choiceNumber[1], choiceNumber[2], choiceNumber[3],choiceNumber[4], choiceNumber[5]])
                if db.lastErrorCode() == 0 {
                    print("저장 성공")
            } else {
                print("저장 실패")
            }
                
            }catch let error as NSError {
                print("failed: \(error.localizedDescription)")
            }
        } else {
            NSLog("디비 연결 오류")
    
    }
        
        
    }
    @IBAction func barBtnLoad(_ sender: UIBarButtonItem) {
        print(#function)
        
        var lottoNumbers = Array<Array<Int>>()
        let db = FMDatabase(path:databasePath as String)
        if ((db.open()) != nil) {
            let selectQuery = "select id, number1, number2, number3, number4, number5, number6 from lotto"
            do{
                
                let result:FMResultSet? = try db.executeQuery(selectQuery, values:[])
                var id = ""
                if result != nil{
                    
                    var resultString:String = ""
                    while result!.next() {
                        
                        
                        
                        //print("result: \(result?.string(forColumn: "number1"))")
                        var columnArray = Array<Int>()
                        
                        columnArray.append(Int(result!.string(forColumn: "number1")!)!)
                        columnArray.append(Int(result!.string(forColumn: "number2")!)!)
                        columnArray.append(Int(result!.string(forColumn: "number3")!)!)
                        columnArray.append(Int(result!.string(forColumn: "number4")!)!)
                        columnArray.append(Int(result!.string(forColumn: "number5")!)!)
                        columnArray.append(Int(result!.string(forColumn: "number6")!)!)
                        
                        id = result!.string(forColumn: "id")!
                        resultString += result!.string(forColumn: "number1")!
                        resultString += result!.string(forColumn: "number2")!
                        resultString += result!.string(forColumn: "number3")!
                        resultString += result!.string(forColumn: "number4")!
                        resultString += result!.string(forColumn: "number5")!
                        resultString += result!.string(forColumn: "number6")!
                        print("\(id):: \(resultString)")
                        
                        resultString = ""
                        
                        
                        lottoNumbers.append(columnArray)
                        NSLog("자료 불러오기 성공") }
                } else {
                    NSLog("자료 불러오기 실패")
                }
            }catch let error as NSError {
                print("failed: \(error.localizedDescription)") }
            tableView.reloadData(); }
        
    }
}

