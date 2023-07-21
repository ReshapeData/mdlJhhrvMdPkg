#' 研发项目更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' deleteCache_rditem()
deleteCache_rditem<- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
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
insertCache_rditem <- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
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
deleteAllcache_rditem <- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql=paste0("truncate table rds_hrv_src_md_rditem_input ")
  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)


}
