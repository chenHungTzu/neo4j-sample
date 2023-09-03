// 匯入資料
LOAD CSV WITH HEADERS FROM 'file:///node-data.csv' AS line
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