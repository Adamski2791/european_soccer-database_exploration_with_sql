SELECT 
    tbl_name, 
    type,
    sql
    
FROM sqlite_master
WHERE type = 'table' ;
