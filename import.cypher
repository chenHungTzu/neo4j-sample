// 匯入資料
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/chenHungTzu/rel-sample/master/node-data.csv' AS line
CREATE (:Org {NodeID: toInteger(line.NodeID), ParentID: toInteger(line.ParentID) , Name : line.Name})

// 拉上關聯
MATCH (org:Org)
MATCH (org2:Org)
WHERE org.NodeID = org2.ParentID 
CREATE (org)-[r:Has]->(org2)


MATCH (n) RETURN n // 看全部節點
MATCH (Org:Org{Name:"OP課"}) RETURN Org // 看特定節點
MATCH (Org:Org{Name:"OP課"})-[:Has]->(Org2:Org) RETURN Org,Org2 // 看底下節點 （1層)
MATCH (Org:Org{Name:"某發展群A"})-[:Has*0..2]->(Org2:Org) RETURN Org,Org2 //看底下節點 （2層)
MATCH (Org:Org{Name:"某發展群A"})-[:Has*]->(Org2:Org) RETURN Org,Org2  // 看底下節點 （Ｎ層)
MATCH (Org:Org{Name:"某發展群A"})-[:Has*1..3]->(Org2:Org) RETURN Org2 // 看底下節點 （1-3層）

// 看底下節點 （沒有子節點的）
MATCH (Org:Org{Name:"某發展群A"})-[:Has*]->(Org2:Org)
WHERE NOT (Org2)-[:Has]->()
RETURN Org2


// 建立使用者
CREATE (:User {Name: '家銘'})
CREATE (:User {Name: '政彥'})

//拉上關聯
MATCH (n:User {Name: '家銘'})
MATCH (o:Org{Name:'某發展群A'})
CREATE (n)-[:Serve]->(o)

MATCH (n:User {Name: '家銘'})
MATCH (o:Org{Name:'POS課'})
CREATE (n)-[:Serve]->(o)


MATCH (n:User {Name: '政彥'})
MATCH (o:Org{Name:'開發Group'})
CREATE (n)-[:Serve]->(o)

MATCH (n:User {Name: '政彥'})
MATCH (o:Org{Name:'PSCS課'})
CREATE (n)-[:Serve]->(o)


// 找底下的組織 (全部)
MATCH (n:User {Name: '家銘'}) - [:Serve] ->(org:Org) 
OPTIONAL MATCH (org)- [:Has*] -> (org2:Org) 
RETURN org,org2

// 找底下組織（一層）
MATCH (n:User {Name: '家銘'}) - [:Serve] ->(org:Org) 
RETURN org


// 建立資料內容 （頁面）
CREATE (:Page {Name: '主檔維護' , PageID:2 , IsEnable:true})
CREATE (:Page {Name: '主檔維護-舊版' , PageID:3 , IsEnable:false})
CREATE (:Page {Name: '案件管理' , PageID:4 , IsEnable:true})
CREATE (:Page {Name: '客戶管理' , PageID:5 , IsEnable:true})

// 拉上關聯
MATCH (o:Org{Name:'某發展群A'})
MATCH (p:Page{Name:'主檔維護'})
CREATE (o)-[:Ctrl]->(p)

MATCH (o:Org{Name:'某發展群A'})
MATCH (p:Page{Name:'主檔維護-舊版'})
CREATE (o)-[:Ctrl]->(p)

MATCH (o:Org{Name:'POS課'})
MATCH (p:Page{Name:'案件管理'})
CREATE (o)-[:Ctrl]->(p)


MATCH (o:Org{Name:'開發Group'})
MATCH (p:Page{Name:'客戶管理'})
CREATE (o)-[:Ctrl]->(p)

MATCH (o:Org{Name:'開發Team'})
MATCH (p:Page{Name:'客戶管理'})
CREATE (o)-[:Ctrl{Effect:"Deny"}]->(p)

MATCH (o:Org{Name:'PSCS課'})
MATCH (p:Page{Name:'客戶管理'})
CREATE (o)-[:Ctrl{Effect:"Deny"}]->(p)


// 找到使用者頁面 (啟用的)
MATCH (user:User{Name:"家銘"})--> (org:Org)
MATCH (org)--> (page:Page{IsEnable:true})
RETURN page


// 找到使用者頁面 (所有關聯都啟用的)
MATCH (user:User{Name:"政彥"}) --> (org:Org) - [:Has*]-> (org2:Org)
MATCH (org) - [c:Ctrl] - (p:Page)
MATCH (org2) - [c2:Ctrl] - (p2:Page)
WHERE c.Effect IS NULL
AND c2.Effect IS NULL
RETURN p,org


// 建立資料內容 (案件)
CREATE (:Case {Title: '緊急叫修-2' , CaseID:2 , IsEnable:true})
CREATE (:Case {Title: '緊急叫修-3' , CaseID:3 , IsEnable:true})

// 拉上關聯
MATCH (o:Org{Name:'開發Group'})
MATCH (p:Case{Title:'緊急叫修-2'})
CREATE (o)-[:Call]->(p)

MATCH (o:Org{Name:'開發Team'})
MATCH (p:Case{Title:'緊急叫修-3'})
CREATE (o)-[:Call]->(p)

// 查看案件
MATCH (user:User{Name:"政彥"}) --> (org:Org) - [:Has*]-> (org2:Org)
MATCH (org) - [c:Call] - (r:Case)
MATCH (org2) - [c2:Call] - (r1:Case)
RETURN r,r1