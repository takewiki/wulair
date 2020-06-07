#' 创建知识点
#'
#' @param conn 连接
#' @param app_id 程序id
#' @param kn_name 标准问名称
#' @param kc_name 知识分类名称
#'
#' @return 返回知识点信息
#' @import reticulate
#' @export
#'
#' @examples
#' kn_create()
kn_create <- function(conn,app_id, kc_name='rdstest2',kn_name="test1_test2_test3") {
  #use_python("/usr/local/bin/python3",required = T);
  tsda::set_py()
  wl <- import('pywulai')
  kms <- wl$kms
  res <- kms$wulai_kn_create(conn,app_id,kn_name, kc_name)
  return(res)

}


#' 知识点获取相应id
#'
#' @param conn 数据库
#' @param app_id 程序
#' @param kn_name 知识点名称
#'
#' @return 返回知识点ID
#' @export
#'
#' @examples
#' kn_getId()
kn_getId <- function(conn,app_id,kn_name) {
  #use_python("/usr/local/bin/python3",required = T);
  tsda::set_py()
  wl <- import('pywulai')
  kms <- wl$kms
  res <- kms$kn_getId(conn,app_id,kn_name)
  return(res)

}




#' 知识点获取名称
#'
#' @param conn 连接
#' @param app_id 程序
#' @param kn_id 知识点ID
#'
#' @return 返回知识点名称
#' @export
#'
#' @examples
#' kn_getName()
kn_getName <- function(conn,app_id,kn_id) {

  #use_python("/usr/local/bin/python3",required = T);
  tsda::set_py()
  wl <- import('pywulai')
  kms <- wl$kms
  res <- kms$kn_getName(conn,app_id,kn_id)
  return (res)

}



#' 删除知识点
#'
#' @param conn 连接
#' @param app_id  程序id
#' @param kn_name 知识点名称
#'
#' @return 返回值
#' @import reticulate
#' @export
#'
#' @examples
#' kn_delete()
kn_delete <- function(conn,app_id,kn_name) {

  #use_python("/usr/local/bin/python3",required = T);
  tsda::set_py()
  wl <- import('pywulai')
  kms <- wl$kms
  res <-kms$wulai_kn_delete(conn,app_id,kn_name)

}


#' 更新知识点
#'
#' @param conn  连接
#' @param app_id 程序id
#' @param old_kn_name  原知识点名称
#' @param new_kn_name  新知识点名称
#'
#' @return 返回值
#' @export
#'
#' @examples
#' kn_update()
kn_update <- function(conn,app_id,old_kn_name,new_kn_name) {
  #use_python("/usr/local/bin/python3",required = T);
  tsda::set_py()
  wl <- import('pywulai')
  kms <- wl$kms

  res <- kms$wulai_kn_update(conn,app_id,old_kn_name,new_kn_name)
  return(res)

}


#' 提交知识点更新到数据库
#'
#' @param conn 连接
#' @param app_id 程序id
#' @param kc_name 知识分类名称
#'
#' @return 返回值
#' @export
#'
#' @examples
#' kn_push()
kn_push <- function(conn,app_id,kc_name) {

  #use_python("/usr/local/bin/python3",required = T);
  tsda::set_py()
  wl <- import('pywulai')
  kms <- wl$kms
  res <- kms$wulai_kn_query(conn,app_id,kc_name)

}
