//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var a = str.characters.count

str.startIndex
str.endIndex

str[str.startIndex.successor()]
str[str.endIndex.predecessor()]
str[str.startIndex.advancedBy(7)]
str[str.endIndex.advancedBy(-3)]

var sfz = "330381304909222911"
var weishu = sfz.characters.count
if weishu == 18 {
var fw = sfz.startIndex.advancedBy(6)...sfz.endIndex.advancedBy(-5)
var c = sfz[fw]
var nian = c.startIndex...c.startIndex.advancedBy(3)
var yue = c.startIndex.advancedBy(4)...c.startIndex.advancedBy(5)
var ri = c.endIndex.advancedBy(-2)...c.endIndex.advancedBy(-1)
    if Int(c[yue]) > 0 && Int(c[yue]) < 13 && Int(c[ri]) > 0 && Int(c[ri]) < 31 {
    var birthday = c[nian] + "年" + c[yue] + "月" + c[ri] + "日"
    print(birthday)
    }
}

var v:String?
for var b in str.characters{
    if b == Character("H"){
        b = Character("k")
    }
    
    
}

let aa = str.characters.split(",")
aa.count
var aaa = String(aa[1])
print(aaa)

var city = ["北京","天津","上海","湖南","一二"]
var city1 = city.sort()


extension String{
    func isou()->Bool{
        return self.characters.count % 2 == 0 ? true : false
    }
}
let ab = str.characters.split(",")
var aa1 = String(ab[0])
var aa2 = String(ab[1])

str.isou()
"hello world!".isou()
"hello".isou()