library(wulair)
library(reticulate)
#初始化处理
conn <- conn()
app_id <-'caas'


#kl_push(conn,app_id,'揽胜试驾礼品是什么')
kl_pushBatch(conn_kms = conn,conn_r = tsda::conn_rds('rdbe'),'caas')
