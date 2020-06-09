#标准答相关内容

#' 创建标准答
#'
#' @param conn 连接
#' @param app_id 程序
#' @param kn_name  知识点名称
#' @param kk_name  标签答名称
#'
#' @return 返回值
#' @export
#'
#' @examples
#' kk_create()
kk_create <- function(conn,app_id,kn_name,kk_name) {

  #use_python("/usr/local/bin/python3",required = T);
  tsda::set_py()
  wl <- import('pywulai')
  kms <- wl$kms
  res <- kms$wulai_kk_create(conn,app_id,kn_name,kk_name)
  return(res)

}


#' 标签答获取id
#'
#' @param conn 连接
#' @param app_id 程序
#' @param kn_name 知识点名称
#' @param kk_name 标签答名称
#'
#' @return 返回值
#' @export
#'
#' @examples
#' kk_getId()
kk_getId <- function(conn,app_id,kn_name,kk_name) {

  #use_python("/usr/local/bin/python3",required = T);
  tsda::set_py()
  wl <- import('pywulai')
  kms <- wl$kms
  res <- kms$kk_getId(conn,app_id,kn_name,kk_name)

}



#' 获取标准答名称
#'
#' @param conn 连接
#' @param app_id 程序
#' @param kk_id ID
#'
#' @return 返回值
#' @export
#'
#' @examples
#' kk_getName()
kk_getName <- function(conn,app_id,kk_id) {


  #use_python("/usr/local/bin/python3",required = T);
  tsda::set_py()
  wl <- import('pywulai')
  kms <- wl$kms
  res <- kms$kk_getName(conn,app_id,kk_id)

}


#' 删除标签答
#'
#' @param conn 连接
#' @param app_id  程序
#' @param kn_name  知识点名称
#' @param kk_name 标签答名称
#'
#' @return 返回值
#' @export
#'
#' @examples
#' kk_delete()
kk_delete <- function(conn,app_id,kn_name,kk_name) {

  #use_python("/usr/local/bin/python3",required = T);
  tsda::set_py()
  wl <- import('pywulai')
  kms <- wl$kms
  res <- kms$wulai_kk_delete(conn,app_id,kn_name,kk_name)
  return(res)

}



#' 更新标准答
#'
#' @param conn 连接
#' @param app_id 程序
#' @param kn_name 知识点名称
#' @param old_kk_name  原标准答
#' @param new_kk_name  新标准答
#'
#' @return 返回值
#' @export
#'
#' @examples
#' kk_update()
kk_update <- function(conn,app_id,kn_name,old_kk_name,new_kk_name) {


  # use_python("/usr/local/bin/python3",required = T);
  tsda::set_py()
  wl <- import('pywulai')
  kms <- wl$kms
  res <- kms$wuali_kk_update(conn,app_id,kn_name,old_kk_name,new_kk_name)

}



#' 提交标签答到数据库
#'
#' @param conn 连接
#' @param app_id 程序
#' @param kn_name  知识点
#'
#' @return 返回值
#' @export
#'
#' @examples
#' kk_push()
kk_push <- function(conn,app_id,kn_name) {


  #use_python("/usr/local/bin/python3",required = T);
  tsda::set_py()
  wl <- import('pywulai')
  kms <- wl$kms

  res <- kms$wulai_kk_query(conn,app_id,kn_name)

}

#' 删除标准答列表数据
#'
#' @param conn_r 连接
#' @param app_id 程序
#'
#' @return 返回值
#' @export
#'
#' @examples
#' get_db_kk_del()
get_db_kk_del <- function(conn_r=tsda::conn_rds('rdbe'),app_id='caas') {
  sql <- paste0("delete   from t_km_kk where Fapp_id ='",app_id,"'")
  tsda::sql_update(conn_r,sql)

}

#' 批量批取标准答
#'
#' @param conn_kms 连接py
#' @param conn_r 连接r
#' @param app_id 程序
#' @param time 间隔时间默认1秒50个
#'
#' @return 返回值
#' @import shiny
#' @export
#'
#' @examples
#' kk_pushBatch
kk_pushBatch <- function(conn_kms,conn_r=tsda::conn_rds('rdbe'),app_id='caas',time=0.02) {
  #删除数据
  get_db_kk_del(conn_r,app_id)
  #
  kn_names <- get_kn_names(conn_r,app_id)

  withProgress(message = '标准答推送处理中', value = 0, {
    ncount =length(kn_names)
    lapply(1:ncount, function(i){
      kn_name <- kn_names[[i]]
      print(kn_name)
      try({
        kk_push(conn_kms,app_id,kn_name)
      })
      incProgress(1/ncount, detail = paste("(",i,"/",ncount,")..."))

      Sys.sleep(time)
    })
  })

  #print(kn_names)


}


#' 自动推送标准答，用于自动同步
#'
#' @param conn_kms py连接
#' @param conn_r   r连接
#' @param app_id 程序
#' @param time 时间间隔
#'
#' @return 返回值
#' @export
#'
#' @examples
#' kk_pushBatch_auto()
kk_pushBatch_auto <- function(conn_kms,conn_r=tsda::conn_rds('rdbe'),app_id='caas',time=0.02) {
  #删除数据
  get_db_kk_del(conn_r,app_id)
  #
  kn_names <- get_kn_names(conn_r,app_id)


    ncount =length(kn_names)
    lapply(1:ncount, function(i){
      kn_name <- kn_names[[i]]
      #print(kn_name)
      try({
        kk_push(conn_kms,app_id,kn_name)
      })


      Sys.sleep(time)

  })

  #print(kn_names)


}




