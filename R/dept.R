#' 规则表更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' deleteCache_dept()
deleteCache_dept<- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {

  sql=paste0("delete rds_hrv_src_md_dept_input
  from rds_hrv_src_md_dept_input
  inner join rds_hrv_src_md_dept
  on
  rds_hrv_src_md_dept_input.FNumber=rds_hrv_src_md_dept.FNumber
  where
  rds_hrv_src_md_dept_input.FUserOrg=rds_hrv_src_md_dept.FUserOrg")

  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)
}
#' 规则表更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' insertCache_dept()
insertCache_dept <- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql=paste0("Insert into rds_hrv_src_md_dept
    Select * from rds_hrv_src_md_dept_input ")

  res=tsda::sql_insert2(token = token,sql_str = sql)
  return(res)

}

#' 规则表更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' deleteAllcache_dept()
deleteAllcache_dept <- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql=paste0("truncate table rds_hrv_src_md_dept_input ")
  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)


}
#' 部门查询
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' ViewDept()
ViewDept<- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql=paste0("SELECT * from rds_hrv_src_md_dept")
  res=tsda::sql_select2(token = token,sql = sql)
  return(res)


}
