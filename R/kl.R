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
  use_python("/usr/local/bin/python3",required = T);
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

  use_python("/usr/local/bin/python3",required = T);
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

  use_python("/usr/local/bin/python3",required = T);
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
  use_python("/usr/local/bin/python3",required = T);
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

  use_python("/usr/local/bin/python3",required = T);
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
#' @param page 页数
#' @param page_size 每页大家
#' @param format 格式
#'
#' @return 返回值
#' @export
#'
#' @examples
#' kl_push()
kl_push <- function(conn,app_id,kn_name, page=1, page_size=50,format='list') {

  use_python("/usr/local/bin/python3",required = T);
  wl <- import('pywulai')
  kms <- wl$kms
  res <- kms$wulai_kl_query(conn,app_id,kn_name, page, page_size,format)
  return(res)

}
