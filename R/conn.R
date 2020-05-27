
#' 获取连接信息
#'
#' @return 返回值
#'
#' @import reticulate
#' @examples
#' get_conn
get_conn <- function() {
  #library(reticulate)
  use_python("/usr/local/bin/python3",required = T);
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
