package util;

import beans.PageInfo;

public class PageUtil {

	public static PageInfo getPage(int pageSize, int rowCount, int pageIndex) {
		// TODO Auto-generated method stub
		PageInfo page=new PageInfo();
		page.setPageSize(pageSize);
		page.setRowCount(rowCount);
		page.setPageIndex(pageIndex);
		int pageCount=0;
		if(rowCount==0){
			pageCount=1;
		}else{
			pageCount=(rowCount+pageSize-1)/pageSize;
		}
		page.setPageCount(pageCount);
		/*if(rowCount%pageSize==0){
			pageCount=rowCount/pageSize;
		}else{
			pageCount=rowCount/pageSize+1;
		}*/
		page.setBeginRow(pageSize*(pageIndex-1));
		page.setHasPre(!(rowCount==0 || pageIndex==1));//判断是否有上一页    pageIndex>1
		page.setHasNext(!(pageIndex == page.getPageCount()));//判断是否有下一页
		return page;
	}
	
}
