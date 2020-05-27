#' 初始化知识分类
#'
#' @param conn 连接信息
#' @param app_id 程序ID
#'
#' @return 无返回值
#' @import reticulate
#' @export
#'
#' @examples
#' kc_init()
kc_init <- function(conn,app_id) {
  use_python("/usr/local/bin/python3",required = T);
  wl <- import('pywulai')
  kms <- wl$kms
  kms$kc_initial_setUp(conn,app_id)
}

#' 同步所有知识分类到数据库
#' 后续根据情况进行更新
#'
#' @param conn 数据库链接
#' @param app_id 程序ID
#'
#' @return 返回值
#' @import reticulate
#' @export
#'
#' @examples
#' kc_updateAll()
kc_updateAll <- function(conn,app_id) {
  use_python("/usr/local/bin/python3",required = T);
  wl <- import('pywulai')
  kms <- wl$kms
  kms$kc_updateAll(conn,app_id)
}

#' 新建知识分类
#'
#' @param conn 连接信息
#' @param app_id 程序代码
#' @param kc_parentName  上级知识分类名称
#' @param kc_name 本级知识分类名称
#'
#' @return 返回值
#' @import reticulate
#' @export
#'
#' @examples
#' kc_create()
kc_create <- function(conn,app_id,kc_parentName,kc_name) {
  use_python("/usr/local/bin/python3",required = T);
  wl <- import('pywulai')
  kms <- wl$kms
  res <- kms$kc_create(conn,app_id,kc_parentName,kc_name)
  return(res)


}

#' 删除知识分类
#'
#' @param conn 连接
#' @param app_id 程序ID
#' @param kc_name 名称
#'
#' @return 返回值
#' @import reticulate
#' @export
#'
#' @examples
#' kc_delete()
kc_delete <- function(conn,app_id,kc_name) {

  use_python("/usr/local/bin/python3",required = T);
  wl <- import('pywulai')
  kms <- wl$kms
  res <-kms$kc_delete(conn,app_id,kc_name)
  return(res)

}


#' 知识分类类更新
#'
#' @param conn 连接
#' @param app_id 程序
#' @param old_kc_name 旧分类名称
#' @param new_kc_name 新分类名称
#'
#' @return 返回值
#' @import reticulate
#' @export
#'
#' @examples
#' kc_update()
kc_update <- function(conn,app_id,old_kc_name,new_kc_name) {
  use_python("/usr/local/bin/python3",required = T);
  wl <- import('pywulai')
  kms <- wl$kms
  res <-kms$kc_update(conn,app_id,old_kc_name,new_kc_name)
  return(res)

}
