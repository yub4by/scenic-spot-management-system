package beans;

public class PageInfo {
	
	private int pageSize;//ÿҳ�ж���������
	private int pageIndex;//��ǰҳ�ǵڼ�ҳ
	private int rowCount;//һ���ж���������
	private int pageCount;//һ���ж���ҳ
	private int beginRow;//��ҳʱ�ӵڼ������ݿ�ʼ
	private boolean hasPre;//�Ƿ�����һҳ
	private boolean hasNext;//�Ƿ�����һҳ
	
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
