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
#' @param uag_id 用户组默认0
#' @param page 页数
#' @param page_size 每页大小
#' @param format 格式
#'
#' @return 返回值
#' @export
#'
#' @examples
#' kl_push()
kl_push <- function(conn,app_id,kn_name, uag_id="0", page=1, page_size=50,format='list') {


  #use_python("/usr/local/bin/python3",required = T);
  tsda::set_py()
  wl <- import('pywulai')
  kms <- wl$kms

  res <- kms$wulai_kk_query(conn,app_id,kn_name, uag_id, page, page_size,format)

}

