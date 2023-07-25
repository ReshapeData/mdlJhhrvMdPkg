#' 规则表更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' deleteCache_dept()
deleteCache_dept<- function(token='9ADDE293-1DC6-4EBC-B8A7-1E5CC26C1F6C') {

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
insertCache_dept <- function(token='9ADDE293-1DC6-4EBC-B8A7-1E5CC26C1F6C') {
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
deleteAllcache_dept <- function(token='9ADDE293-1DC6-4EBC-B8A7-1E5CC26C1F6C') {
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
ViewDept<- function(token='9ADDE293-1DC6-4EBC-B8A7-1E5CC26C1F6C') {
  sql=paste0("SELECT * from rds_hrv_src_md_dept")
  data=tsda::sql_select2(token = token,sql = sql)
  col_selected = c('FDepNameManual','FNumber','FDepName','FDepNameComplete','FUserOrg','FNotes')
  dataview=data[ ,col_selected]

  dataview$高新部门=data$FDepNameManual


  dataview$编码=data$FNumber


  dataview$名称=data$FDepName
  dataview$部门全称=data$FDepNameComplete

  dataview$使用组织=data$FUserOrg


  dataview$备注=data$FNotes


  res=dataview[,c('高新部门','编码','名称','部门全称','使用组织','备注')]

  return(res)

}
