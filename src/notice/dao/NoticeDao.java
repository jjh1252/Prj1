package notice.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import notice.db.DBCon;
import notice.vo.Notice;

public class NoticeDao {
	
	//삭제
	public int delete(String seq) throws Exception {
		String sql="delete from notices where seq=?";
		//db connect
		//드라이버로드
		Connection con=DBCon.getConnection();
		//실행
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, seq);
		int af=pstmt.executeUpdate();//return int
		
		return af;
	}
	
//=========================================================	
	//입력
	public int insert(Notice not) throws Exception {
		String sql ="insert into notices values("
				+"(select max(to_number(seq))+1 from notices),"
				+"?,'cj',?,SYSTIMESTAMP,0)";
		
		//DBCon 에서 만든 DB드라이버 연결을 가져와서 con으로 넣어준다.
		Connection con = DBCon.getConnection();
		
		//실행
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, not.getTitle());
		pstmt.setString(2, not.getContent());
		//자원회수
		pstmt.close();
		con.close();
		//결과
		int af = pstmt.executeUpdate();
		
		return af;

	}

//=========================================================
	//수정
	public int update(Notice n) throws Exception {
		String sql ="update notices set title =?, content=? where seq=?";

		//DBCon 에서 만든 DB드라이버 연결을 가져와서 con으로 넣어준다.
		Connection con = DBCon.getConnection();
		//실행
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, n.getTitle());
		pstmt.setString(2, n.getContent());
		pstmt.setString(3, n.getSeq());
		//결과
		int af = pstmt.executeUpdate();
		System.out.println("af : " + af);
		return af;
		
	}

//=========================================================
	//조회
	public List<Notice> getNotices() throws Exception {
		String sql ="select * from notices order by to_number(seq) desc";
		
		//DB연결
		Connection con = DBCon.getConnection();
		//실행
		Statement st = con.createStatement();
		//결과
		ResultSet rs = st.executeQuery(sql);
		
		//리스트에담기 한줄이아니라 조회라 여러줄이 나오기때문에
		List<Notice> list = new ArrayList<Notice>();
		while(rs.next()){
			Notice n = new Notice();
			n.setSeq(rs.getString("seq"));
			n.setTitle(rs.getString("title"));
			n.setWriter(rs.getString("Writer"));
			n.setContent(rs.getString("content"));
			n.setRegdate(rs.getDate("regdate"));
			n.setHit(rs.getInt("hit"));
			
			//위 seq,title등등을 리스트에 담기
			list.add(n);
		}
		//정보를 다 담아줬으니 자원회수
		rs.close();
		st.close();
		con.close();
		
		return list;
	}
	
//=========================================================	
	//조회수 올리기
	public Notice getNotice(String seq, String hit) throws Exception {
		
		//DBCon 에서 만든 DB드라이버 연결을 가져와서 con으로 넣어준다.
		Connection con = DBCon.getConnection();
		
		//아래 조회수 메소드 호출 하면서 조회수가 증가한다
		hitupdate(seq, hit, con);
		
		
		String sql ="select * from notices where seq="+seq;

		//실행
		Statement st = con.createStatement();
		//결과
		ResultSet rs = st.executeQuery(sql); //rs에는 레코드 1개가 들어와있다
		rs.next();//레코드1개만 들어와있기때문에 while문을 쓸필요없고 next로 1개의 레코드를 출력할수있다.
		
		//Notice객체 생성
		Notice n = new Notice();
		//noticeDetail에서 필요한 정보를 Notice에 담아보기
		//rs에 들어온 seq정보를 가져와서 n.setSeq로 
		//Notice클래스 private String seq에다 정보를 보내준다.
		n.setSeq(rs.getString("seq"));
		n.setTitle(rs.getString("title"));
		n.setWriter(rs.getString("Writer"));
		n.setContent(rs.getString("content"));
		n.setRegdate(rs.getDate("regdate"));
		n.setHit(rs.getInt("hit"));
		//정보를 다 담아줬으니 자원회수
		rs.close();
		st.close();
		con.close();
				
		return n;
		
	}
//=========================================================	
	//조회수 메소드
	private void hitupdate(String seq, String hit, Connection con) throws SQLException {
		//hit이 String값이고 DB에있는 hit이 number값이기때문에  형변환해준다
		int num = Integer.parseInt(hit);
		String hsql = "update notices set hit = ? where seq = ?";
		PreparedStatement pstmt = con.prepareStatement(hsql);
		pstmt.setInt(1, num+1);//+1 한이유는 신호가 들어올때마다 1씩 증가시키기 위함
		pstmt.setString(2, seq);
		
		//실행 //update문 실행하는거
		pstmt.executeUpdate();
	}

//=========================================================		
public Notice getNotice(String seq) throws Exception {
		
		//DBCon 에서 만든 DB드라이버 연결을 가져와서 con으로 넣어준다.
		Connection con = DBCon.getConnection();
				
		String sql ="select * from notices where seq="+seq;

		//실행
		Statement st = con.createStatement();
		//결과
		ResultSet rs = st.executeQuery(sql); //rs에는 레코드 1개가 들어와있다
		rs.next();//레코드1개만 들어와있기때문에 while문을 쓸필요없고 next로 1개의 레코드를 출력할수있다.
		
		//Notice객체 생성
		Notice n = new Notice();
		//noticeDetail에서 필요한 정보를 Notice에 담아보기
		//rs에 들어온 seq정보를 가져와서 n.setSeq로 
		//Notice클래스 private String seq에다 정보를 보내준다.
		n.setSeq(rs.getString("seq"));
		n.setTitle(rs.getString("title"));
		n.setWriter(rs.getString("Writer"));
		n.setContent(rs.getString("content"));
		n.setRegdate(rs.getDate("regdate"));
		n.setHit(rs.getInt("hit"));
		//정보를 다 담아줬으니 자원회수
		rs.close();
		st.close();
		con.close();
				
		return n;
		
	}
	
}
