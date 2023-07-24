#' 科目更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' deleteCache_cosucompany()
deleteCache_cosucompany<- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql=paste0("Delete from rds_hrv_src_md_cosucompany_input Where FNumber in(select FNumber from rds_hrv_src_md_cosucompany)")

  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)
}
#' 科目更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' insertCache_cosucompany()
insertCache_cosucompany <- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql=paste0("Insert into rds_hrv_src_md_cosucompany
    Select * from rds_hrv_src_md_cosucompany_input ")

  res=tsda::sql_insert2(token = token,sql_str = sql)
  return(res)

}

#' 科目更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' deleteAllcache_cosucompany()
deleteAllcache_cosucompany <- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql=paste0("truncate table rds_hrv_src_md_cosucompany_input ")
  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)


}
#' 往来单位查询
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' ViewCosucompany()
ViewCosucompany<- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql=paste0("SELECT * from rds_hrv_src_md_cosucompany")
  res=tsda::sql_select2(token = token,sql = sql)
  return(res)


}
