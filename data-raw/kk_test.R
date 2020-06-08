library(wulair)
library(reticulate)
#初始化处理
conn <- conn()
app_id <-'caas'

#kk_push(conn,app_id,'kntest1')

kk_pushBatch(conn_kms = conn,conn_r = tsda::conn_rds('rdbe'),'caas')
