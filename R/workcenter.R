#' 核算维度_责任中心更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' deleteCache_workcenter()
deleteCache_workcenter<- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql=paste0("Delete from rds_hrv_src_md_workcenter_input Where FNumber in(select FNumber from rds_hrv_src_md_workcenter)")

  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)
}
#' 核算维度_责任中心更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' insertCache_workcenter()
insertCache_workcenter <- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql=paste0("Insert into rds_hrv_src_md_workcenter
    Select * from rds_hrv_src_md_workcenter_input ")

  res=tsda::sql_insert2(token = token,sql_str = sql)
  return(res)

}

#' 核算维度_责任中心更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' deleteAllcache_workcenter()
deleteAllcache_workcenter <- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql=paste0("truncate table rds_hrv_src_md_workcenter_input ")
  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)


}
