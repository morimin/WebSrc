package kr.or.rapa1.bbs;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;

public class BBSList {

	private ArrayList<Integer> idxList = new ArrayList<Integer>();
	private ArrayList<String> titleList = new ArrayList<String>();
	private ArrayList<String> writerList = new ArrayList<String>();
	private ArrayList<Date> ymdList = new ArrayList<Date>();  // ctrl+shft+o-> sql 로 추가
	private ArrayList<Time> hmsList = new ArrayList<Time>();  // ctrl+shft+o-> sql 로 추가	
	private ArrayList<Integer> hitList = new ArrayList<Integer>();
	private ArrayList<Integer> spaceList = new ArrayList<Integer>();
	
	private ArrayList<Integer> noticeList = new ArrayList<Integer>();
	private ArrayList<String> headList = new ArrayList<String>();  // for 공지
	
	private boolean lastpage = false;  // 마지막 페이지 체크 코드 를 위함.
	
	private int rlevel ;
	private int wlevel ;
	
	private int dataCount;  // 몇개의 데이터가 있는지 알아야 페이지를 안다
	private int maxPage;  
	
		
	// dataCount 와 maxPage 관련 getters & setters
	public int getDataCount() {
		return dataCount;
	}

	public void setDataCount(int dataCount) {
		this.dataCount = dataCount;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	
	// Rlevel / Wlevel 관련 getters & setters
	public int getRlevel() {
		return rlevel;
	}

	public void setRlevel(int rlevel) {
		this.rlevel = rlevel;
	}

	public int getWlevel() {
		return wlevel;
	}

	public void setWlevel(int wlevel) {
		this.wlevel = wlevel;
	}

	/* Generate Getters & Setters 로 하면 리스트 항목지 좀 달라서 문제가 생기므로 직접 만들어야함 */
	//
	// 직접 Setters 를 만드는 과정
	public void setIdx(Integer idx)
	{
		this.idxList.add(idx);  
	}
	
	/* Set noticeList */
	public void setNotice(Integer notice)
	{
		this.noticeList.add(notice);  
	}
	
	/* Set headList */
	public void setHead(String head)
	{
		this.headList.add(head);  
	}
	
	public void setTitle(String title)
	{
		this.titleList.add(title);  
	}
	
	public void setWriter(String writer)
	{
		this.writerList.add(writer);  
	}
	
	public void setYmd(Date ymd)
	{
		this.ymdList.add(ymd);  
	}
	
	public void setHms(Time hms)
	{
		this.hmsList.add(hms);  
	}
	
	public void setHit(Integer hit)
	{
		this.hitList.add(hit);  
	}
	public void setSpace(Integer space)
	{
		this.spaceList.add(space);  
	}
	
	// 직접 Getters 를 만드는 과정 
	public Integer[] getIdx()
	{
		return idxList.toArray( new Integer[idxList.size()] ); 
		// ; idx리스트 크기만큼의 배열로 리턴해준다.
	}
	
	/* Get noticeList */
	public Integer[] getNotice()
	{
		return noticeList.toArray( new Integer[noticeList.size()] ); 
		// ; idx리스트 크기만큼의 배열로 리턴해준다.
	}
	
	/* Get headList */
	public String[] getHead()
	{
		return headList.toArray( new String[headList.size()] );		
	}
	
	
	public String[] getTitle()
	{
		return titleList.toArray( new String[titleList.size()] );		
	}
	
	public String[] getWriter()
	{
		return writerList.toArray( new String[writerList.size()] );		
	}
	
	public Date[] getYmd()
	{
		return ymdList.toArray( new Date[ymdList.size()] );		
	}
	
	public Time[] getHms()
	{
		return hmsList.toArray( new Time[hmsList.size()] );		
	}
	
	public Integer[] getHit()
	{
		return hitList.toArray( new Integer[hitList.size()] ); 
		// ; idx리스트 크기만큼의 배열로 리턴해준다.
	}
	public Integer[] getSpace()
	{
		return spaceList.toArray( new Integer[spaceList.size()] ); 
		// ; idx리스트 크기만큼의 배열로 리턴해준다.
	}

	// Lastpage는 배열 형식이 아니기 때문에 generate Getters & Setters 로 만들어도 된다.
	public boolean isLastpage() {
		return lastpage;
	}

	public void setLastpage(boolean lastpage) {
		this.lastpage = lastpage;
	}
	
	
	/* 현재 게시글 수를 리턴 해주는 메소드 */
	public int getListSize()
	{
		return idxList.size();
	}
	
	

	
	
}// BBSList Class



