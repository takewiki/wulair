library(wulair)
library(reticulate)
#初始化处理
conn <- conn()
app_id <-'caas'

kn_name = 'kntest11'

kc_name = 'RDS'

kl_name='kntest11_kl4'

kk_name ='kktest112'

res <- kn_create(conn,app_id,kc_name,kn_name)
#print(res)

res_kk <- kk_create(conn,app_id,kn_name,kk_name)
#print(res_kk)

res_kl <- kl_create(conn,app_id,kn_name,kl_name)
print(res_kl)




#use_python("/usr/local/bin/python3",required = T);
#wl <- import('pywulai')
#kms <- wl$kms
#res <- kms$wulai_kn_create(conn,app_id,kn_name, kc_name)

#print(res)
