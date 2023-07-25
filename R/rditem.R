#' 研发项目更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' deleteCache_rditem()
deleteCache_rditem<- function(token='9ADDE293-1DC6-4EBC-B8A7-1E5CC26C1F6C') {
  sql=paste0("Delete from rds_hrv_src_md_rditem_input Where FRDProjectManual in(select FRDProjectManual from rds_hrv_src_md_rditem)")

  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)
}
#' 研发项目更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' insertCache_rditem()
insertCache_rditem <- function(token='9ADDE293-1DC6-4EBC-B8A7-1E5CC26C1F6C') {
  sql=paste0("Insert into rds_hrv_src_md_rditem
    Select * from rds_hrv_src_md_rditem_input ")

  res=tsda::sql_insert2(token = token,sql_str = sql)
  return(res)

}

#' 研发项目更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' deleteAllcache_rditem()
deleteAllcache_rditem <- function(token='9ADDE293-1DC6-4EBC-B8A7-1E5CC26C1F6C') {
  sql=paste0("truncate table rds_hrv_src_md_rditem_input ")
  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)


}

#' 研发项目查询
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' ViewRditem()
ViewRditem<- function(token='9ADDE293-1DC6-4EBC-B8A7-1E5CC26C1F6C') {
  sql=paste0("SELECT * from rds_hrv_src_md_rditem")
  data=tsda::sql_select2(token = token,sql = sql)
  col_selected = c('FOrg','FRDProjectManual','FRDProject')
  dataview=data[ ,col_selected]
  dataview$组织=data$FOrg

  dataview$RD项目 = data$FRDProjectManual


  dataview$系统项目名称=data$FRDProject


  res=dataview[,c('组织','RD项目','系统项目名称')]

  return(res)

}
