package beans;

public class PageInfo {
	
	private int pageSize;//每页有多少条数据
	private int pageIndex;//当前页是第几页
	private int rowCount;//一共有多少条数据
	private int pageCount;//一共有多少页
	private int beginRow;//分页时从第几条数据开始
	private boolean hasPre;//是否有上一页
	private boolean hasNext;//是否有下一页
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getRowCount() {
		return rowCount;
	}
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getBeginRow() {
		return beginRow;
	}
	public void setBeginRow(int beginRow) {
		this.beginRow = beginRow;
	}
	public boolean isHasPre() {
		return hasPre;
	}
	public void setHasPre(boolean hasPre) {
		this.hasPre = hasPre;
	}
	public boolean isHasNext() {
		return hasNext;
	}
	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}
	@Override
	public String toString() {
		return "PageInfo [pageSize=" + pageSize + ", pageIndex=" + pageIndex
				+ ", rowCount=" + rowCount + ", pageCount=" + pageCount
				+ ", beginRow=" + beginRow + ", hasPre=" + hasPre
				+ ", hasNext=" + hasNext + "]";
	}
	
}
