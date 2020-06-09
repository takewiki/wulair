#相似问相关内容
#' 创建相似问相关仙鹤
#'
#' @param conn 连接
#' @param app_id 程序id
#' @param kn_name 知识点名称
#' @param kl_name 相似问名称
#'
#' @return 返回值
#' @export
#'
#' @examples
#' kn_create()
kl_create <- function(conn,app_id,kn_name, kl_name="test1212") {
  #use_python("/usr/local/bin/python3",required = T);
  tsda::set_py()
  wl <- import('pywulai')
  kms <- wl$kms
  res <- kms$wulai_kl_create(conn,app_id,kn_name, kl_name)
  return(res)

}


#' 删除知识叶
#'
#' @param conn 连接
#' @param app_id 程序id
#' @param kn_name 知识点名称
#' @param kl_name 知识页名称
#'
#' @return 返回值
#' @export
#'
#' @examples
#' kl_delete()
kl_delete <- function(conn,app_id,kn_name,kl_name) {

  # use_python("/usr/local/bin/python3",required = T);
  tsda::set_py()
  wl <- import('pywulai')
  kms <- wl$kms
  res <- kms$wulai_kl_delete(conn,app_id,kn_name,kl_name)
  return(res)

}




#' 根据名称获取相应的id
#'
#' @param conn 连接
#' @param app_id 程序
#' @param kn_name 知识点名称
#' @param kl_name  相似问名称
#'
#' @return 返回值
#' @export
#'
#' @examples
#' kl_getId()
kl_getId <- function(conn,app_id,kn_name,kl_name) {

  #use_python("/usr/local/bin/python3",required = T);
  tsda::set_py()
  wl <- import('pywulai')
  kms <- wl$kms
  res <- kms$kl_getId(conn,app_id,kn_name,kl_name)

}




#' 获取相似问问名称假设具有唯一性
#'
#' @param conn  连接
#' @param app_id 程序
#' @param kl_id 相似问ID
#'
#' @return 返回值
#' @export
#'
#' @examples
#' kl_getName()
kl_getName <- function(conn,app_id,kl_id) {
  #use_python("/usr/local/bin/python3",required = T);
  tsda::set_py()
  wl <- import('pywulai')
  kms <- wl$kms
  res <- kms$kl_getName(conn,app_id,kl_id)

}




#' 更新相似问
#'
#' @param conn  连接
#' @param app_id 程序
#' @param kn_name 知识点名称
#' @param old_kl_name 原相似问名称
#' @param new_kl_name 新相似问名称
#'
#' @return 返回值
#' @export
#'
#' @examples
#' kl_update()
kl_update <- function(conn,app_id,kn_name,old_kl_name,new_kl_name) {

  #use_python("/usr/local/bin/python3",required = T);
  tsda::set_py()
  wl <- import('pywulai')
  kms <- wl$kms
  res <- kms$wulai_kl_update(conn,app_id,kn_name,old_kl_name,new_kl_name)
  return(res)

}


#' 提交相似问更新到数据库
#'
#' @param conn 连接
#' @param app_id 程序
#' @param kn_name 知识点名称
#'
#' @return 返回值
#' @export
#'
#' @examples
#' kl_push()
kl_push <- function(conn,app_id,kn_name) {

  #use_python("/usr/local/bin/python3",required = T);
  tsda::set_py()
  wl <- import('pywulai')
  kms <- wl$kms
  res <- kms$wulai_kl_query(conn,app_id,kn_name)
  return(res)

}


#' 删除相似问列表
#'
#' @param conn_r 连接
#' @param app_id 程序
#'
#' @return 返回值
#' @export
#'
#' @examples
#' get_db_kl_del()
get_db_kl_del <- function(conn_r=tsda::conn_rds('rdbe'),app_id='caas') {
  sql <- paste0("delete   from t_km_kl where Fapp_id ='",app_id,"'")
  tsda::sql_update(conn_r,sql)

}


#' 针对相似问进行推送
#'
#' @param conn_kms 连接py
#' @param conn_r 连接r
#' @param app_id 程序
#' @param time 时间
#'
#' @return 返回值
#' @import shiny
#' @export
#'
#' @examples
#' kl_pushBatch()
kl_pushBatch <- function(conn_kms,conn_r=tsda::conn_rds('rdbe'),app_id='caas',time=0.02) {
  #删除数据
  get_db_kl_del(conn_r,app_id)
  #
  kn_names <- get_kn_names(conn_r,app_id)

  withProgress(message = '相似问推送处理中', value = 0, {
    ncount =length(kn_names)
    lapply(1:ncount, function(i){
      kn_name <- kn_names[[i]]
      print(kn_name)
      try({
        kl_push(conn_kms,app_id,kn_name)
      })
      incProgress(1/ncount, detail = paste("(",i,"/",ncount,")..."))

      Sys.sleep(time)
    })
  })

  #print(kn_names)


}



#' 同步处理相似问的同步
#'
#' @param conn_kms py连接
#' @param conn_r r连接
#' @param app_id 程序
#' @param time 时间
#'
#' @return 返回值
#' @export
#'
#' @examples
#' kl_pushBatch_auto()
kl_pushBatch_auto <- function(conn_kms,conn_r=tsda::conn_rds('rdbe'),app_id='caas',time=0.02) {
  #删除数据
  get_db_kl_del(conn_r,app_id)
  #
  kn_names <- get_kn_names(conn_r,app_id)


    ncount =length(kn_names)
    lapply(1:ncount, function(i){
      kn_name <- kn_names[[i]]
      print(kn_name)
      try({
        kl_push(conn_kms,app_id,kn_name)
      })


      Sys.sleep(time)

  })

  #print(kn_names)


}
