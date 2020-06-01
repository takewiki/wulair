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
#' kc_push()
kc_push <- function(conn,app_id) {
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

#' 获取知识分类id
#'
#' @param conn  连接
#' @param app_id 程序名
#' @param kc_name 知识分类名称
#'
#' @return 返回值
#' @import reticulate
#' @export
#'
#' @examples
#' kc_getId()
kc_getId <- function(conn,app_id,kc_name) {
  use_python("/usr/local/bin/python3",required = T);
  wl <- import('pywulai')
  kms <- wl$kms
  res <-kms$kc_getId(conn,app_id,kc_name)
  return(res)

}

#' 获取知识分类名称
#'
#' @param conn 连接信息
#' @param app_id 程序id
#' @param kc_id 分类知识点id
#'
#' @return 返回值
#' @import reticulate
#' @export
#'
#' @examples
#' kc_getName()
kc_getName <- function(conn,app_id,kc_id) {
  use_python("/usr/local/bin/python3",required = T);
  wl <- import('pywulai')
  kms <- wl$kms
  res <- kms$kc_getName(conn,app_id,kc_id)
  return(res)

}


#' 获取上级知识分类的id
#'
#' @param conn 连接
#' @param app_id 程序名称
#' @param kc_name 知识分类名称
#'
#' @return 返回值
#' @import reticulate
#' @export
#'
#' @examples
#' kc_getParentId()
kc_getParentId <- function(conn,app_id,kc_name) {
  use_python("/usr/local/bin/python3",required = T);
  wl <- import('pywulai')
  kms <- wl$kms
  res < - kms$kc_getParentId(conn,app_id,kc_name)
  return (res)

}


#' 获取知识点的上级分类名称
#'
#' @param conn  连接
#' @param app_id  程序
#' @param kc_name  分类名称
#'
#' @return 返回值
#' @import reticulate
#' @export
#'
#' @examples
#' kc_getParentName()
kc_getParentName <- function(conn,app_id,kc_name) {
  use_python("/usr/local/bin/python3",required = T);
  wl <- import('pywulai')
  kms <- wl$kms

  res <- kms$kc_getParentName(conn,app_id,kc_name)
  return(res)

}


#' 知识库查询，直接从数据库中进行查询
#'
#' @param conn 连接信息
#' @param app_id 程序id
#'
#' @return 返回值
#' @export
#'
#' @examples
#' kc_query()
kc_query <- function(conn,app_id) {
  sql <- paste0("select a.Fid as kc_id,a.Fname as kc_name ,b.Fid as kc_parnetId,b.Fname as kc_parentName from t_km_kc a
inner join t_km_kc b
on a.FparentId = b.Fid and a.Fapp_id = b.Fapp_id
where a.Fapp_id ='",app_id,"'")
  res <- tsda::sql_select(conn,sql)
  return(res)

}
