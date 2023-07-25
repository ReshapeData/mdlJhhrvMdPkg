#' 核算维度_责任中心更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' deleteCache_workcenter()
deleteCache_workcenter<- function(token='9ADDE293-1DC6-4EBC-B8A7-1E5CC26C1F6C') {
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
insertCache_workcenter <- function(token='9ADDE293-1DC6-4EBC-B8A7-1E5CC26C1F6C') {
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
deleteAllcache_workcenter <- function(token='9ADDE293-1DC6-4EBC-B8A7-1E5CC26C1F6C') {
  sql=paste0("truncate table rds_hrv_src_md_workcenter_input ")
  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)


}
#' 责任中心查询
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' ViewWorkcenter()
ViewWorkcenter<- function(token='9ADDE293-1DC6-4EBC-B8A7-1E5CC26C1F6C') {
  sql=paste0("SELECT * from rds_hrv_src_md_workcenter")
  data=tsda::sql_select2(token = token,sql = sql)
  col_selected = c('FNumber','FDept')
  dataview=data[ ,col_selected]
  dataview$编码=data$FNumber

  dataview$部门名称 = data$FDept



  res=dataview[,c('编码','部门名称')]

  return(res)


}
