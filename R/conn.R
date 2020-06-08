
#' 获取连接信息
#'
#' @return 返回值
#'
#' @import reticulate
#' @examples
#' get_conn
get_conn <- function() {
  #library(reticulate)
  #use_python("/usr/local/bin/python3",required = T);
  #不再使用连接的方式
  #使用虚拟环境更容易对python包进行维护
  #use_virtualenv('/opt/my_env',required = TRUE)
  tsda::set_py()
  pyrda <-  import('pyrda')
  sqlserver <- pyrda$sqlserver
  conn <- sqlserver$conn_create('115.159.201.178', 'sa', 'Hoolilay889@', 'rdbe')
  return(conn)

}

#' 配置连接信息
#'
#' @return 返回值
#' @export
#'
#' @examples
#' conn()
conn <- function() {
  res <- get_conn()
  return(res)

}


#' 获取分类列表名称
#'
#' @param conn 连接
#' @param app_id 程序
#'
#' @return 返回值
#' @export
#'
#' @examples
#' get_kc_names()
get_kc_names <- function(conn=tsda::conn_rds('rdbe'),app_id='caas') {
  sql <- paste0("select Fname from t_km_kc where Fapp_id ='",app_id,"'")
  data <- tsda::sql_select(conn,sql)
  ncount <- nrow(data)
  if(ncount>0){
    item <- data$Fname
    res <- tsdo::vect_as_list(item)

  }else{
    res <-list("")
  }
  return(res)

}


#' 获取名称点的所有问题列表
#'
#' @param conn_r 连接
#' @param app_id 程序
#'
#' @return 返回值
#' @export
#'
#' @examples
#' get_kn_names()
get_kn_names <- function(conn_r=tsda::conn_rds('rdbe'),app_id='caas') {
  sql <-paste0("select Fkn_name from t_km_kn where Fapp_id ='",app_id,"'")
  data <- tsda::sql_select(conn_r,sql)
  ncount <- nrow(data)
  if(ncount>0){
    item <- data$Fkn_name
    res <- tsdo::vect_as_list(item)

  }else{
    res <-list("")
  }
  return(res)

}
