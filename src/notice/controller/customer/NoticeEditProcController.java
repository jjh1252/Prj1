package notice.controller.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeEditProcController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeEditProcController");
		String seq = request.getParameter("c");
		//String title = request.getParameter("title");
		//String content = request.getParameter("content");
		
		//한글깨졋을때
		String title = new String(request.getParameter("title").getBytes("iso-8859-1"),"utf-8");
		String content = new String(request.getParameter("content").getBytes("iso-8859-1"),"utf-8");
		
		System.out.println("title : " + title);
		
		//NoticeDao 객체생성
		NoticeDao dao = new NoticeDao();
		Notice n = new Notice();
		n.setSeq(seq);
		n.setTitle(title);
		n.setContent(content);
		
		//Notice getNotice에서 작업한 값을 가져온다.
		int af = dao.update(n);
		
		n = dao.getNotice(seq);
		//request에 n을 저장
		request.setAttribute("n", n);
		//jsp로 forward
		request.getRequestDispatcher("noticeDetail.jsp").forward(request, response);

		
	}

	
	/*public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeEditController");
		String seq = request.getParameter("c");
		//NoticeDao 객체생성
		NoticeDao dao = new NoticeDao();
		//Notice getNotice에서 작업한 값을 가져온다.
		Notice n = dao.getNotice(seq);
		
		//request에 n을 저장
      request.setAttribute("n", n);
      //jsp로 forward
      request.getRequestDispatcher("noticeEdit.jsp").forward(request, response);

	}
	*/
}
